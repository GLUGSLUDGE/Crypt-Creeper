//
//  HowToPlay.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 23/2/23.
//

import SwiftUI

struct HowToPlay: View {
    var body: some View {
        
        ZStack{
            Color.accentColor
                .ignoresSafeArea()
            PopUpsView(bodyContent: {
                ScrollView{
                    VStack{
                        Divider()
                            .frame(width: 330 ,height:7)
                            .background(Color.white)
                            .padding(.horizontal,10)
                            .padding(.top,75)
                            .overlay(alignment: .top){
                                HStack{
                                    Image("ICON_ENTITY_PLAYER")
                                        .resizable()
                                        .frame(width: 100 ,height:100)
                                        .scaledToFit()
                                        .padding(.bottom,60)
                                    
                                    Text("PLAYER")
                                        .font(.system(size: 32,weight:.heavy,design: .monospaced))
                                        .foregroundColor(.white)
                                        .padding(.bottom,50)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                }
                            }
                        HStack{
                            Text("You have 3 stats:")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .padding(.leading,20)
                                .padding(.top,20)
                            Spacer()
                        }
                        HStack{
                            Image("ICON_UI_HEALTH")
                                .resizable()
                                .frame(width: 40,height:40)
                                .scaledToFit()
                                .padding(.leading ,20 )
                                .padding(.vertical,-10)
                            
                            Text("LIFE")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        HStack{
                            
                            Image("ICON_UI_COIN")
                                .resizable()
                                .frame(width: 40 ,height:40)
                                .scaledToFit()
                                .padding(.leading,20)
                                .padding(.vertical,-10)
                            Text("COINS")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        HStack{
                            Image("ICON_UI_XP")
                                .resizable()
                                .frame(width: 40 ,height:40)
                                .scaledToFit()
                                .padding(.leading,20)
                                .padding(.vertical,-10)
                            Text("EXPERIENCE")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                            
                        }
                        Text("You start with 2 empty inventory slots:")
                            .font(.system(size: 20,weight: .heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.leading,-50)
                            .multilineTextAlignment(.leading)
                        
                        HStack{
                            
                            Image("Sword")
                                .resizable()
                                .frame(width: 40 ,height:40)
                                .scaledToFit()
                                .padding(.leading,20)
                                .padding(.vertical,-10)
                            Text("SWORD")
                                .font(.system(size: 20,weight: .heavy,design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        HStack{
                            Image("Shield")
                                .resizable()
                                .frame(width: 40 ,height:40)
                                .scaledToFit()
                                .padding(.leading,20)
                                .padding(.vertical,-10)
                            Text("SHIELD")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        
                    }
                    VStack{
                        Divider()
                            .frame(width: 330 ,height:7)
                            .background(Color.white)
                            .padding(.horizontal,10)
                            .padding(.top, 35)
                            .overlay(alignment: .topLeading){
                                Text("MOVEMENTS")
                                    .font(.system(size: 32,weight: .heavy,design: .monospaced))
                                    .foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                        
                        Text("Tap any tile next to the player character to move into its position.\n\nThe tile you move into will determine the action type.")
                            .font(.system(size: 20,weight: .heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.leading)
                        HStack{
                            Image("ICON_ENTITY_EMPTY")
                                .resizable()
                                .frame(width: 110 ,height:110)
                                .scaledToFit()
                                .padding(.horizontal,20)
                                .padding(.vertical,-10)
                            Text("WATCH OUT! You cannot move into empty tiles.")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.leading)
                            
                            
                            Spacer()
                        }
                        
                    }
                    VStack{
                        Divider()
                            .frame(width: 330 ,height:7)
                            .background(Color.white)
                            .padding(.horizontal,10)
                            .padding(.top, 35)
                            .overlay(alignment: .topLeading){
                                Text("PICKUPS")
                                    .font(.system(size: 32,weight: .heavy,design: .monospaced))
                                    .foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                        Text("Moving into an item tile will pick it up automatically.")
                            .font(.system(size: 20,weight: .heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.leading,5)
                            .multilineTextAlignment(.leading)
                        HStack{
                            Image("ICON_SWORD_2")
                                .resizable()
                                .frame(width: 80 ,height:80)
                                .scaledToFit()
                                .padding(.horizontal,20)
                                .padding(.vertical,-5)
                            Text("SWORD: Sets your sword power.")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                           
                        }
                        HStack{
                            Image("ICON_SHIELD_2")
                                .resizable()
                                .frame(width: 80 ,height:80)
                                .scaledToFit()
                                .padding(.horizontal,20)
                                .padding(.vertical,-5)
                            Text("SHIELD: Sets your shield power.")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        HStack{
                           
                            Image("ICON_POTION_3")
                                .resizable()
                                .frame(width: 80 ,height:80)
                                .scaledToFit()
                                .padding(.horizontal,20)
                                .padding(.vertical,-5)
                            Text("POTION: Recovers life..")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        HStack{

                            Image("ICON_COIN_2")
                                .resizable()
                                .frame(width: 80 ,height:80)
                                .scaledToFit()
                                .padding(.horizontal,20)
                                .padding(.vertical,-5)
                            Text("COINS: Picked up, cumulative.")
                                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
            }, title: "How to play ", show: true)
            
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}

