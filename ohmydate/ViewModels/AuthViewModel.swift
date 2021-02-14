//
//  AuthViewModel.swift
//  ohmydate
//
//  Created by Carlo Carpio on 2/14/21.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: failed to login. \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
        }
    }
    
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to upload image. \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Succesfully uploaded the image.")
            
            storageRef.downloadURL { (url, _) in
                guard let profileImage = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: error \(error.localizedDescription)")
                    }
                    
                    print("DEBUG: Successfully signed up a user.")
                    guard let user = result?.user else { return }
                    let data = [
                        "email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "profileImageUrl": profileImage,
                        "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: Succesfully uploaded user data.")
                        self.userSession = user
                    }
                }
            }
        }
        
    }
    
}
