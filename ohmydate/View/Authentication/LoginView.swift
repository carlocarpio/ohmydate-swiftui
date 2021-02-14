//
//  LoginView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/12/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 12) {
                        CustomTextField(text: $email, imageName: "envelope", placeholder: Text("Email"))
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
                            viewModel.login(withEmail: email, password: password)
                        }, label: {
                            Text("Login")
                                .padding()
                        })
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 32)
                    
                    
                    VStack() {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack {
                                Text("Forgot your password?")
                                Text("Get Help Signing in.")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                        })
                        
                        HStack(alignment: .center) {
                            Rectangle()
                                .frame(width: (UIScreen.main.bounds.width / 2) - 60, height: 1, alignment: .center)
                                .foregroundColor(.white)
                            
                            Text("OR")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                            
                            Rectangle()
                                .frame(width: (UIScreen.main.bounds.width / 2) - 60, height: 1, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        
                        HStack(spacing: 20) {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("facebook")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .frame(width: 48, height: 48)
                            })
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("google")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .frame(width: 48, height: 48)
                            })
                        }
                        
                    }
                    .padding(.vertical, 22)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                Text("Sign up here.")
                                    .fontWeight(.semibold)
                            }
                            .font(.system(size: 14))
                            .padding(.vertical, 40)
                            .foregroundColor(.white)
                        })
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
