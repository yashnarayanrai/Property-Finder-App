//
//  ImageComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct ImageComponent: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("propertyImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 249)
                .clipped()
                .overlay(
                    VStack{
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .font(.title3)
                                    .foregroundColor(Color.theme.black)
                                    .frame(width: 44, height: 44)
                                    .background(Color(UIColor.systemBackground))
                                    .clipShape(Circle())
                            }
                            .contentShape(Rectangle())
                            
                            Spacer()
                            
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrowshape.turn.up.right")
                                    .font(.title3)
                                    .foregroundColor(Color.theme.black)
                                    .frame(width: 44, height: 44)
                                    .background(Color(UIColor.systemBackground))
                                    .clipShape(Circle())
                            }
                            .contentShape(Rectangle())
                        }
                        
                        Spacer()
                        
                        HStack{
                            Text("Caption Growth")
                                .font(.caption2).bold()
                                .foregroundColor(Color.theme.white)
                                .padding(.horizontal, 8)
                                .background(Color.theme.gray.opacity(0.6))
                                .clipShape(Capsule())
                            
                            
                            Spacer()
                            
                            Text("1/6")
                                .font(.caption2).bold()
                                .foregroundColor(Color.theme.white)
                                .padding(.horizontal, 8)
                                .background(Color.theme.gray.opacity(0.6))
                                .clipShape(Capsule())
                            
                        }
                    }
                    .padding()
                    .padding(.top)
                )
        }
    }
}

struct ImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        ImageComponent()
    }
}
