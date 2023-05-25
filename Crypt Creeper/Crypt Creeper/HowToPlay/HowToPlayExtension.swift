//
//  HowToPlayExtension.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 25/2/23.
//

import SwiftUI

extension HowToPlayView {
    private struct textView : View{
        @State var text : String
        var body: some View{
            HStack{
                Text(text)
                    .font(.system(size: 20,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.leading,20)
                    .padding(.top,20)
                Spacer()
            }
        }
    }
    
    private struct columView : View{
        @State var setImage:String
        @State var setText:String
        
        var body: some View{
            HStack{
                Image(setImage)
                    .resizable()
                    .frame(width: 80 ,height:80)
                    .scaledToFit()
                    .padding(.leading,40)
                    .padding(.vertical,-5)
                Text(setText)
                    .font(.system(size: 20,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
            }
        }
    }
    private struct dividerImage: View{
        @State var setImage:String
        @State var setText:String
        var body: some View{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top,75)
                .overlay(alignment: .top){
                    HStack{
                        Image(setImage)
                            .resizable()
                            .frame(width: 100 ,height:100)
                            .scaledToFit()
                            .padding(.bottom,60)
                        
                        Text(setText)
                            .font(.system(size: 32,weight:.heavy,design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom,50)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                }
        }
    }
    private struct divider :View {
        @State var setText :String
        var body: some View{
            Divider()
                .frame(width: 330 ,height:7)
                .background(Color.white)
                .padding(.horizontal,10)
                .padding(.top, 35)
                .overlay(alignment: .topLeading){
                    Text(setText)
                        .font(.system(size: 32,weight: .heavy,design: .rounded))
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                }
        }
    }
    func vPlayer()-> some View{
        VStack{
            dividerImage(setImage: "ICON_ENTITY_PLAYER", setText: "PLAYER")
            
            textView(text: "You have 3 stats:")
            
            HStack{
                Image("ICON_UI_HEALTH")
                    .resizable()
                    .frame(width: 40,height:40)
                    .scaledToFit()
                    .padding(.leading ,20 )
                    .padding(.vertical,-10)
                
                Text("LIFE")
                    .font(.system(size: 20,weight: .heavy,design: .rounded))
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
                    .font(.system(size: 20,weight: .heavy,design: .rounded))
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
                    .font(.system(size: 20,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                Spacer()
                
            }
            
            textView(text: "You start with 2 empty inventory slots:")
            Spacer()
            
            
            HStack{
                Image("ICON_UI_SWORD")
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
                Image("ICON_UI_SHIELD")
                    .resizable()
                    .frame(width: 40 ,height:40)
                    .scaledToFit()
                    .padding(.leading,10)
                    .padding(.vertical,-10)
                Text("SHIELD")
                    .font(.system(size: 20,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                Spacer()
            }
            
            
        }
    }
    func vMovements()->some View{
        VStack{
            divider(setText: "MOVEMENTS")
            textView(text: "Tap any tile next to the player character to move into its position.\n\nThe tile you move into will determine the action type.")
            HStack{
                Image("ICON_ENTITY_EMPTY")
                    .resizable()
                    .frame(width: 110 ,height:110)
                    .scaledToFit()
                    .padding(.horizontal,20)
                    .padding(.vertical,-10)
                textView(text: "WATCH OUT! You cannot move into empty tiles.")
                Spacer()
            }
            
        }
    }
    func vPICKUPS()->some View{
        VStack{
            divider(setText: "PICKUPS")
            
            textView(text: "Moving into an item tile will pick it up automatically.")
            columView(setImage: "ICON_SWORD_2", setText: "SWORD: Sets your sword power.")
            columView(setImage: "ICON_SHIELD_2", setText: "SHIELD: Sets your shield power.")
            columView(setImage: "ICON_POTION_3", setText: "Recovers life.")
            
            columView(setImage: "ICON_COIN_2", setText: "COINS: Picked up,cumulative.")
        }
    }
    func vMonsters()-> some View {
        VStack{
            dividerImage(setImage: "ICON_ENEMY_1", setText: "MONSTERS")
            textView(text: "Moving into a monster tile triggers combat.\n\nSWORDS and SHIELD power will be sent lowering the MONSTER’s power.\n\nRemaining power is dealt as damage to the Player’s life.\n\nA defeated monster will give the player Experience points.")
            
        }
    }
    func vTemple()-> some View {
        VStack{
            dividerImage(setImage: "ICON_ENTITY_TEMPLE", setText: "TEMPLE")
            
            textView(text: "In the temple you may spend experience points on upgrades.")
            
            columView(setImage: "ICON_C_MAXHEALTH", setText: "MAX LIFE + (up to 6).")
            columView(setImage: "ICON_C_SLOT", setText: "HOLD SLOT + (up to 3). ")
            columView(setImage: "ICON_C_FULLHEAL", setText:"FULL HEAL.")
            
            textView(text: "HOLD SLOTS work by moving a PICK UP into the slot for later use.\n\nTap the HOLD SLOT tile while empty and select an available pick up to grab.\n\nTap the HOLD SLOT while holding to activate that PICKUP.")
        }
    }
    func vShop()-> some View {
        VStack{
            dividerImage(setImage: "ICON_ENTITY_SHOP", setText: "SHOP")
            textView(text: "A shop will have random items for sale.They can be traded for coins. \n\nSome special items need to be grabbed for purchase:")
            
            columView(setImage: "ICON_C_BOMB", setText: "Deals 2 damage to every MONSTER.")
            columView(setImage: "ICON_C_GREENP", setText: "Turns every empty tile into a POWER 1 monster.")
            columView(setImage: "ICON_C_RERROLL", setText: "REROLL level, PLAYER returns to starting tile.")
            
            
        }
    }
    func vLevels()-> some View{
        VStack{
            dividerImage(setImage: "ICON_ENTITY_PORTAL", setText: "LEVELS")
            textView(text: "The player starts at the bottom and must reach the portal to warp to the next level.")
            
        }
    }
    func vGoal()-> some View{
        VStack{
            
            dividerImage(setImage: "ICON_ENEMY_8", setText: "GOAL")
            textView(text: "The goal of the game is to kill the DEMON BOSS waiting in LVL20.\n")
            
        }
    }
    func vScore()-> some View {
        VStack{
            divider(setText: "SCORE")
            textView(text: "Every action results in points being added to your score, clearing out each level as much as you can without trapping yourself is the key to HIGHSCORES.\n\n")
            
        }
    }
}
