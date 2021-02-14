//
//  RegistrationView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/12/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var fullname = ""
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 12) {
                    
                    Button(action: { showImagePicker.toggle() }, label: {
                        ZStack {
                            if let image = image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipped()
                                    .cornerRadius(70)
                                    .padding(.bottom, 20)
                            } else {
                                Image("plus_photo")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .frame(width: 140, height: 140)
                                    .clipped()
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                            }
                        }
                    })
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedUIImage)
                    })
                    
                    CustomTextField(text: $email, imageName: "envelope", placeholder: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullname, imageName: "person", placeholder: Text("Full Name"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, imageName: "person", placeholder: Text("Username"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, imageName: "lock", placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        guard let image = selectedUIImage else { return }
                        viewModel.registerUser(
                            email: email,
                            password: password,
                            username: username,
                            fullname: fullname,
                            profileImage: image)
                    }, label: {
                        Text("Sign up")
                            .padding()
                    })
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                        Text("Sign in.")
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 40)
                    .foregroundColor(.white)
                })
            }
            .padding(.top, 70)
        }
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.top)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
