//
//  HowToPlayExtension.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 25/2/23.
//

import SwiftUI

extension HowToPlayView {
    func vPlayer()-> some View{
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
                    .frame(width: 30,height:30)
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
                    .padding(.leading,10)
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
                    .padding(.leading,10)
                    .padding(.vertical,-10)
                Text("SHIELD")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                Spacer()
            }
            
            
        }
    }
    func vMovements()->some View{
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
                .padding(.horizontal, 15)
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
                    .padding(.horizontal, 5)
                    .multilineTextAlignment(.leading)
                
                
                Spacer()
            }
            
        }
    }
    func vPICKUPS()->some View{
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
            HStack{
                Text("Moving into an item tile will pick it up automatically.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading, 15)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            HStack{
                Image("ICON_SWORD_2")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("SWORD: Sets your sword power.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
                
            }
            HStack{
                Image("ICON_SHIELD_2")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("SHIELD: Sets your shield power.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
            HStack{
                
                Image("ICON_POTION_3")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("POTION: Recovers life.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
            HStack{
                Image("ICON_COIN_2")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("COINS: Picked up,cumulative.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
        }
    }
    func vMonsters()-> some View {
        VStack{
            Divider()
                .frame(width: 327 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top,65)
                .overlay(alignment: .top){
                    HStack{
                        Image("ICON_ENEMY_1")
                            .resizable()
                            .frame(width: 100 ,height:100)
                            .scaledToFit()
                            .padding(.bottom,60)
                        
                        Text("MONSTERS")
                            .font(.system(size: 32,weight:.heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.bottom,65)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                }
            Text("Moving into a monster tile triggers combat.\n\nSWORDS and SHIELD power will be sent lowering the MONSTER’s power.\n\nRemaining power is dealt as damage to the Player’s life.\n\nA defeated monster will give the player Experience points.")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 20)
        }
    }
    func vTemple()-> some View {
        VStack{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top,65)
                .overlay(alignment: .top){
                    HStack{
                        Image("ICON_ENTITY_TEMPLE")
                            .resizable()
                            .frame(width: 100 ,height:100)
                            .scaledToFit()
                            .padding(.bottom,60)
                        Text("TEMPLE")
                            .font(.system(size: 32,weight:.heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.bottom,65)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
            Text("In the temple you may spend experience points on upgrades.")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 20)
                .multilineTextAlignment(.leading)
            HStack{
                Image("ICON_POTION_3")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("MAX LIFE + (up to 6).")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
            HStack{
                Image("ICON_POTION_3")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("HOLD SLOT + (up to 3).")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
            HStack{
                Image("ICON_POTION_3")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text("FULL HEAL.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
            Text("HOLD SLOTS work by moving a PICK UP into the slot for later use.\n\nTap the HOLD SLOT tile while empty and select an available pick up to grab.\n\nTap the HOLD SLOT while holding to activate that PICKUP.\n\nYou may cancel a grab by clicking the empty slot again.\n")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 20)
        }
    }
    func vShop()-> some View {
        VStack{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top,65)
                .overlay(alignment:.top){
                    HStack{
                        Image("ICON_ENTITY_SHOP")
                            .resizable()
                            .frame(width: 100 ,height:100)
                            .scaledToFit()
                            .padding(.bottom,60)
                        
                        
                        Text("SHOP")
                            .font(.system(size: 32,weight:.heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.bottom,65)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                    }
                }
            
            Text("A shop will have random items for sale.They can be traded for coins. \n\nSome special items need to be grabbed for purchase:")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 40)
                
            HStack{
                
                Image("ICON_COIN_2")
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.horizontal,20)
                    .padding(.vertical,-5)
                Text("Deals 2 damage to every MONSTER.")
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
                Text("Turns every empty tile into a POWER 1 monster.")
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
                Text("REROLL level, PLAYER returns to starting tile.")
                    .font(.system(size: 20,weight: .heavy,design: .monospaced))
                    .foregroundColor(.white)
                    
                Spacer()
            }
            
        }
    }
    func vLevels()-> some View{
        VStack{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top,65)
                .overlay(alignment: .top){
                    HStack{
                        Image("ICON_ENTITY_PORTAL")
                            .resizable()
                            .frame(width: 100 ,height:100)
                            .scaledToFit()
                            .padding(.bottom,60)
                        
                        Text("LEVES")
                            .font(.system(size: 32,weight:.heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.bottom,65)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                }
            Text("The player starts at the bottom and must reach the portal to warp to the next level.")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 20)
                .multilineTextAlignment(.leading)
        }
    }
    func vGoal()-> some View{
        VStack{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top,65)
                .overlay(alignment: .top){
                    HStack{
                        Image("ICON_ENEMY_8")
                            .resizable()
                            .frame(width: 100 ,height:100)
                            .scaledToFit()
                            .padding(.bottom,60)
                        Text("GOAL")
                            .font(.system(size: 32,weight:.heavy,design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.bottom,65)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                }
            Text("The goal of the game is to kill the DEMON BOSS waiting in LVL20.\n")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 20)
                .multilineTextAlignment(.leading)
        }
    }
    func vScore()-> some View {
        VStack{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top, 35)
                .overlay(alignment: .topLeading){
                    Text("SCORE")
                        .font(.system(size: 32,weight: .heavy,design: .monospaced))
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                }
            
            Text("Every action results in points being added to your score, clearing out each level as much as you can without trapping yourself is the key to HIGHSCORES.")
                .font(.system(size: 20,weight: .heavy,design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top , 20)

                .multilineTextAlignment(.leading)
        }
    }
}
