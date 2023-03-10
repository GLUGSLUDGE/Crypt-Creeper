//
//  GameScene.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 1/3/23.
//

import Foundation
import SpriteKit
import SwiftUI

@MainActor class GameScene: SKScene, ObservableObject {
    @Published var coins:Int = 0
    @Published var health:Int = 3
    @Published var maxHealth:Int = 3
    @Published var level:Int = 1
    @Published var score:Int = 0
    @Published var xp:Int = 0
    @Published var swordPower:Int = 0
    @Published var shieldPower:Int = 0
    @Published var inventorySlots:[Item] = []
    
    @Published var showShop:Bool = false
    @Published var showTemple:Bool = false
    @Published var showWin:Bool = false
    @Published var showGameOver:Bool = false
    
    private let intSize = 15
    private var locations:[Array<CGFloat>] = []
    
    func reset(){
        print("game was reset!!!")
        maxHealth = 3
        health = 3
        coins = 0
        level = 1
        score = 0
        xp = 0
        swordPower = 0
        shieldPower = 0
        inventorySlots = [Item]()
        removeAllChildren()
        createBoard()
    }
    
    override func didMove(to view: SKView) {
        locations = gridLocations()
        createBoard()
        increaseInventory()

    }
    func heal(amount:Int){
        health += amount
        if health > maxHealth {
            health = maxHealth
        }
    }
    func useItem(item: Item){
        switch(item.type){
        case ItemType.BOMB:
            //deals 2 damage to every monster
            break
        case ItemType.RERROLL:
            //Rerolls the floor
            break
        case ItemType.GREENP:
            //Turns every monster into power 1
            break
        case ItemType.POTION:
            //Cure
            break
        case ItemType.SWORD:
            let tPower = swordPower
            swordPower = item.power
            item.power = tPower
            if item.power == 0 {
                item.sprite = Image("ICON_ENTITY_EMPTY")
                item.type = ItemType.NONE
            } else {
                item.sprite = Image("ICON_SWORD_\(item.power)")
            }
            break
        case ItemType.SHIELD:
            let tPower = shieldPower
            shieldPower = item.power
            item.power = tPower
            if item.power == 0 {
                item.sprite = Image("ICON_ENTITY_EMPTY")
                item.type = ItemType.NONE
            } else {
                item.sprite = Image("ICON_SHIELD_\(item.power)")
            }
            break
        case ItemType.NONE: break
        case .MAXH: break
        case .FULLH: break
        case .SLOT: break
        }
    }
    func increaseInventory(){
        if inventorySlots.count < 3 {
            inventorySlots.append(Item(nType: ItemType.NONE, nPrice: 0, nPower: 0))
        }
    }
    func saveSword(){
        if inventorySlots.isEmpty {
            return
        }
        var success = false
        for item in inventorySlots {
            if !success{
                if item.type == ItemType.NONE {
                    item.type = ItemType.SWORD
                    item.power = swordPower
                    item.sprite = Image("ICON_SWORD_\(item.power)")
                    swordPower = 0
                    success = true
                }
            }
        }
    }
    func saveShield(){
        if inventorySlots.isEmpty {
            return
        }
        var success = false
        for item in inventorySlots {
            if !success{
                if item.type == ItemType.NONE {
                    item.type = ItemType.SHIELD
                    item.power = shieldPower
                    item.sprite = Image("ICON_SHIELD_\(item.power)")
                    shieldPower = 0
                    success = true
                }
            }
        }
    }
    func createBoard(){
        let portalrandomX = Int.random(in: 1...5)
        var enemyAmount = 0
        var potionAmount = 0
        var shieldAmount = 0
        var swordAmount = 0
        var coinAmount = 0
        var npcAmount = 0
        for i in 1...5 {
            for j in 1...5{
                let newTile = Tile(imageNamed: "ICON_ENTITY_EMPTY")
                newTile.name = "EMPTY"
                newTile.size = CGSize(width: intSize, height: intSize)
                newTile.position = CGPoint(x: locations[0][i], y: locations[1][j])
                newTile.x = i
                newTile.y = j
                if i == 3 && j == 1 { //Spawn tile
                    newTile.texture = SKTexture(imageNamed: "ICON_ENTITY_PLAYER")
                    newTile.name = "PLAYER"
                } else if j == 5 && i == portalrandomX { //Portal tile
                    if level == 20 {
                        spawnTile(tile: newTile, type: EntityType.Boss)
                    } else {
                        spawnTile(tile: newTile, type: EntityType.Portal)
                    }
                } else { //Every other tile
                    let chance = Int.random(in: 1...100)
                    if chance <= 50 {
                        if enemyAmount < maxAmountsPerLevel(type: EntityType.Enemy){
                            spawnTile(tile: newTile, type: EntityType.Enemy)
                            enemyAmount+=1
                        }
                    } else if chance <= 60 {
                        if potionAmount < maxAmountsPerLevel(type: EntityType.Potion){
                            spawnTile(tile: newTile, type: EntityType.Potion)
                            potionAmount+=1
                        }
                    } else if chance <= 70 {
                        if shieldAmount < maxAmountsPerLevel(type: EntityType.Shield){
                            spawnTile(tile: newTile, type: EntityType.Shield)
                            shieldAmount+=1
                        }
                    }
                    else if chance <= 80 {
                        if swordAmount < maxAmountsPerLevel(type: EntityType.Sword){
                            spawnTile(tile: newTile, type: EntityType.Sword)
                            swordAmount+=1
                        }
                    } else if chance <= 90 {
                        if coinAmount < maxAmountsPerLevel(type: EntityType.Coin){
                            spawnTile(tile: newTile, type: EntityType.Coin)
                            coinAmount+=1
                        }
                    } else {
                        randomTile(tile: newTile)
                    }
                }
                if newTile.name == "EMPTY" {
                    let npcChance = Int.random(in: 1...100)
                    if npcChance > 90 && level != 1 {
                        if npcAmount < 1 {
                            let type = Int.random(in: 1...2)
                            if type == 1{
                                newTile.name = "SHOP"
                                newTile.texture = SKTexture(imageNamed: "ICON_ENTITY_SHOP")
                            } else {
                                newTile.name = "TEMPLE"
                                newTile.texture = SKTexture(imageNamed: "ICON_ENTITY_TEMPLE")
                            }
                            npcAmount = 1
                        } else {
                            randomTile(tile: newTile)
                        }
                    } else {
                        randomTile(tile: newTile)
                    }
                }
                
                addPowerLabel(tile: newTile)
                
                addChild(newTile)
            }
        }
    }
    func addPowerLabel(tile: Tile){
        if tile.power != 0{
            let powerLabel = SKSpriteNode(texture: SKTexture(imageNamed: "num_\(tile.power)"))
            powerLabel.size = CGSize(width: 5, height: 5)
            powerLabel.name = "LABEL"
            powerLabel.zPosition = tile.zPosition+12
            powerLabel.position = CGPoint(x:5,y:-3)
            tile.addChild(powerLabel)
        }
    }
    func nextLevel(){
        level+=1
        removeAllChildren()
        createBoard()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchNode = atPoint(location)
        
        if ((touchNode as? SKScene) == nil) { //<-- Node is touched
            if touchNode.name != "PLAYER" && touchNode.name != "LABEL" {
                //Check the adjacent nodes
                let destination = touchNode as! Tile
                if destination.name == "EMPTY"{
                    return
                }
                
                var canMove = false
                var finishedLevel = false
                
                for tile in adjacentTilesTo(x: destination.x, y: destination.y){
                    if tile!.name ==  "PLAYER"{
                        canMove = true
                    }
                }
                if !canMove {
                    //showGameOver = true
                    return
                }
                switch(destination.name){
                case "PORTAL":
                    score += level*100
                    finishedLevel = true
                case "ENEMY":
                    var damage = destination.power
                    while damage != 0 && swordPower != 0 {
                        swordPower-=1
                        damage-=1
                    }
                    while damage != 0 && shieldPower != 0 {
                        shieldPower-=1
                        damage-=1
                    }
                    while damage != 0 && health != 0 {
                        health-=1
                        damage-=1
                    }
                    if health == 0 {
                       showGameOver = true
                    }
                    score+=destination.power*10
                    switch(destination.power){
                    case 1: xp+=1
                    case 2: xp+=4
                    case 3: xp+=9
                    case 4: xp+=16
                    case 5: xp+=30
                    case 6: xp+=50
                    case 7: xp+=90
                    case 8: xp+=200
                    default: break
                    }
                case "COIN":
                    coins += destination.power
                case "POTION":
                    heal(amount: destination.power)
                case "SHIELD":
                    shieldPower = destination.power
                case "SWORD":
                    swordPower = destination.power
                case "SHOP":
                    showShop = true
                case "TEMPLE":
                    showTemple = true
                case "BOSS":
                    var damage = destination.power
                    while damage != 0 && swordPower != 0 {
                        swordPower-=1
                        damage-=1
                    }
                    while damage != 0 && shieldPower != 0 {
                        shieldPower-=1
                        damage-=1
                    }
                    while damage != 0 && health != 0 {
                        health-=1
                        damage-=1
                    }
                    if health == 0 {
                       showGameOver = true
                    } else {
                        showWin = true
                    }
                default: break
                    
                }
                
                //MOVE
                let player = childNode(withName: "PLAYER") as! Tile
                //Spawn an empty space on your previous position
                let oldTile = Tile()
                spawnTile(tile: oldTile, type: EntityType.Empty)
                oldTile.size = CGSize(width: intSize, height: intSize)
                oldTile.y = player.y
                oldTile.zPosition = player.zPosition-1
                oldTile.x = player.x
                oldTile.position = CGPoint(x: locations[0][oldTile.x], y: locations[1][oldTile.y])
                addChild(oldTile)
                //Carry out the actions
                let ac = SKAction.move(to: destination.position, duration: 0.1)
                
                player.run(ac) {
                    player.x = destination.x
                    player.y = destination.y
                    destination.removeAllChildren()
                    destination.removeFromParent()
                }
                if finishedLevel {
                    let nextLevelAction = SKAction.rotate(toAngle: 6, duration: 0.3)
                    player.run(nextLevelAction){
                        self.nextLevel()
                    }
                }
            }
        }
    }
    
    
    //MARK: - Max and min amounts of entities and powers
    //This function returns the max amount of entities per level
    func maxAmountsPerLevel(type: EntityType) -> Int {
        var max = 0
        switch(type){
        case EntityType.Empty:
            max = 0
        case EntityType.Player:
            max = 0
        case EntityType.Portal:
            max = 0
        case EntityType.Enemy:
            switch(level){
            case 1: max = 12
            case 2: max = 12
            case 3: max = 12
            case 4: max = 12
            case 5: max = 14
            case 6: max = 14
            case 7: max = 14
            case 8: max = 14
            case 9: max = 14
            case 10: max = 16
            case 11: max = 16
            case 12: max = 16
            case 13: max = 16
            case 14: max = 16
            case 15: max = 16
            case 16: max = 17
            case 17: max = 17
            case 18: max = 17
            case 19: max = 17
            case 20: max = 17
            default: max = 12
            }
        case EntityType.Sword:
            switch(level){
            case 1: max = 4
            case 2: max = 5
            case 3: max = 5
            case 4: max = 5
            case 5: max = 5
            case 6: max = 5
            case 7: max = 5
            case 8: max = 5
            case 9: max = 5
            case 10: max = 5
            case 11: max = 4
            case 12: max = 4
            case 13: max = 4
            case 14: max = 3
            case 15: max = 3
            case 16: max = 6
            case 17: max = 6
            case 18: max = 6
            case 19: max = 6
            case 20: max = 3
            default: max = 4
            }
        case EntityType.Shield:
            switch(level){
            case 1: max = 4
            case 2: max = 4
            case 3: max = 4
            case 4: max = 4
            case 5: max = 4
            case 6: max = 4
            case 7: max = 4
            case 8: max = 4
            case 9: max = 4
            case 10: max = 5
            case 11: max = 3
            case 12: max = 3
            case 13: max = 1
            case 14: max = 3
            case 15: max = 3
            case 16: max = 2
            case 17: max = 2
            case 18: max = 4
            case 19: max = 5
            case 20: max = 3
            default: max = 4
            }
        case EntityType.Potion:
            switch(level){
            case 1: max = 4
            case 2: max = 4
            case 3: max = 3
            case 4: max = 2
            case 5: max = 1
            case 6: max = 2
            case 7: max = 2
            case 8: max = 1
            case 9: max = 2
            case 10: max = 3
            case 11: max = 2
            case 12: max = 2
            case 13: max = 2
            case 14: max = 1
            case 15: max = 4
            case 16: max = 3
            case 17: max = 3
            case 18: max = 3
            case 19: max = 1
            case 20: max = 2
            default: max = 4
            }
        case EntityType.Coin:
            switch(level){
            case 1: max = 2
            case 2: max = 2
            case 3: max = 3
            case 4: max = 3
            case 5: max = 3
            case 6: max = 2
            case 7: max = 2
            case 8: max = 1
            case 9: max = 2
            case 10: max = 3
            case 11: max = 2
            case 12: max = 2
            case 13: max = 4
            case 14: max = 3
            case 15: max = 2
            case 16: max = 2
            case 17: max = 2
            case 18: max = 4
            case 19: max = 2
            case 20: max = 1
            default: max = 4
            }
        case EntityType.Shop:
            if level != 1{
                max = 1
            } else {
                max = 0
            }
        case EntityType.Temple:
            if level != 1{
                max = 1
            } else {
                max = 0
            }
        case EntityType.Boss:
            max = 0
        }
        return max
    }
    //This function returns the max amount of POWER per entity
    func maxAmounts(type: EntityType) -> Int{
        var max = 0
        switch(type){
        case EntityType.Empty:
            max = 0
        case EntityType.Player:
            max = 0
        case EntityType.Portal:
            max = 0
        case EntityType.Enemy:
            switch(level){
            case 1: max = 2
            case 2: max = 2
            case 3: max = 3
            case 4: max = 3
            case 5: max = 3
            case 6: max = 3
            case 7: max = 4
            case 8: max = 4
            case 9: max = 4
            case 10: max = 4
            case 11: max = 5
            case 12: max = 6
            case 13: max = 6
            case 14: max = 6
            case 15: max = 6
            case 16: max = 6
            case 17: max = 6
            case 18: max = 7
            case 19: max = 7
            case 20: max = 7
            default: max = 7
            }
        case EntityType.Sword:
            switch(level){
            case 1: max = 2
            case 2: max = 2
            case 3: max = 3
            case 4: max = 3
            case 5: max = 3
            case 6: max = 3
            case 7: max = 3
            case 8: max = 3
            case 9: max = 3
            case 10: max = 4
            case 11: max = 4
            case 12: max = 4
            case 13: max = 4
            case 14: max = 3
            case 15: max = 3
            case 16: max = 3
            case 17: max = 4
            case 18: max = 5
            case 19: max = 5
            case 20: max = 5
            default: max = 4
            }
        case EntityType.Shield:
            switch(level){
            case 1: max = 2
            case 2: max = 2
            case 3: max = 3
            case 4: max = 3
            case 5: max = 3
            case 6: max = 3
            case 7: max = 3
            case 8: max = 3
            case 9: max = 3
            case 10: max = 4
            case 11: max = 4
            case 12: max = 4
            case 13: max = 4
            case 14: max = 3
            case 15: max = 3
            case 16: max = 3
            case 17: max = 4
            case 18: max = 5
            case 19: max = 5
            case 20: max = 5
            default: max = 4
            }
        case EntityType.Potion:
            switch(level){
            case 1: max = 2
            case 2: max = 2
            case 3: max = 2
            case 4: max = 2
            case 5: max = 2
            case 6: max = 2
            case 7: max = 2
            case 8: max = 2
            case 9: max = 2
            case 10: max = 3
            case 11: max = 3
            case 12: max = 3
            case 13: max = 2
            case 14: max = 4
            case 15: max = 4
            case 16: max = 2
            case 17: max = 2
            case 18: max = 2
            case 19: max = 4
            case 20: max = 3
            default: max = 4
            }
        case EntityType.Coin:
            switch(level){
            case 1: max = 2
            case 2: max = 2
            case 3: max = 2
            case 4: max = 2
            case 5: max = 2
            case 6: max = 2
            case 7: max = 2
            case 8: max = 2
            case 9: max = 2
            case 10: max = 2
            case 11: max = 3
            case 12: max = 3
            case 13: max = 3
            case 14: max = 3
            case 15: max = 3
            case 16: max = 3
            case 17: max = 3
            case 18: max = 3
            case 19: max = 3
            case 20: max = 3
            default: max = 3
            }
        case EntityType.Shop:
            max = 0
        case EntityType.Temple:
            max = 0
        case EntityType.Boss:
            max = 8
        }
        return max
    }
    //This function return the min amount of POWER per entity
    func minAmounts(type: EntityType) -> Int{
        var min = 0
        switch(type){
        case EntityType.Empty:
            min = 0
        case EntityType.Player:
            min = 0
        case EntityType.Portal:
            min = 0
        case EntityType.Enemy:
            switch(level){
            case 1: min = 1
            case 2: min = 1
            case 3: min = 1
            case 4: min = 1
            case 5: min = 1
            case 6: min = 1
            case 7: min = 2
            case 8: min = 2
            case 9: min = 2
            case 10: min = 2
            case 11: min = 2
            case 12: min = 2
            case 13: min = 2
            case 14: min = 3
            case 15: min = 3
            case 16: min = 3
            case 17: min = 4
            case 18: min = 4
            case 19: min = 5
            case 20: min = 5
            default: min = 1
            }
        case EntityType.Sword:
            switch(level){
            case 1: min = 1
            case 2: min = 1
            case 3: min = 1
            case 4: min = 1
            case 5: min = 1
            case 6: min = 1
            case 7: min = 2
            case 8: min = 2
            case 9: min = 2
            case 10: min = 2
            case 11: min = 2
            case 12: min = 2
            case 13: min = 2
            case 14: min = 3
            case 15: min = 3
            case 16: min = 3
            case 17: min = 3
            case 18: min = 3
            case 19: min = 4
            case 20: min = 3
            default: min = 1
            }
        case EntityType.Shield:
            switch(level){
            case 1: min = 1
            case 2: min = 1
            case 3: min = 1
            case 4: min = 1
            case 5: min = 1
            case 6: min = 1
            case 7: min = 2
            case 8: min = 2
            case 9: min = 2
            case 10: min = 2
            case 11: min = 2
            case 12: min = 2
            case 13: min = 2
            case 14: min = 3
            case 15: min = 3
            case 16: min = 3
            case 17: min = 3
            case 18: min = 3
            case 19: min = 4
            case 20: min = 3
            default: min = 1
            }
        case EntityType.Potion:
            switch(level){
            case 1: min = 1
            case 2: min = 1
            case 3: min = 1
            case 4: min = 1
            case 5: min = 1
            case 6: min = 1
            case 7: min = 1
            case 8: min = 1
            case 9: min = 1
            case 10: min = 1
            case 11: min = 1
            case 12: min = 2
            case 13: min = 2
            case 14: min = 2
            case 15: min = 3
            case 16: min = 2
            case 17: min = 1
            case 18: min = 1
            case 19: min = 2
            case 20: min = 1
            default: min = 1
            }
        case EntityType.Coin:
            switch(level){
            case 1: min = 1
            default: min = 1
            }
        case EntityType.Shop:
            min = 0
        case EntityType.Temple:
            min = 0
        case EntityType.Boss:
            min = 8
        }
        return min
    }
    //MARK: - Tile spawn
    func randomTile(tile: Tile){
        let randomSel = Int.random(in: 1...5)
        var randomElement = EntityType.Coin
        switch(randomSel){
        case 1: randomElement = EntityType.Coin
        case 2: randomElement = EntityType.Enemy
        case 3: randomElement = EntityType.Potion
        case 4: randomElement = EntityType.Shield
        default: randomElement = EntityType.Sword
        }
        tile.type = randomElement
        spawnTile(tile: tile, type: tile.type)
    }
    func spawnTile(tile: Tile, type: EntityType){
        tile.type = type
        tile.power = Int.random(in: minAmounts(type: type)...maxAmounts(type: type))
        switch(type){
        case .Empty:
            tile.name = "EMPTY"
            tile.power = 0
            tile.texture = SKTexture(imageNamed: "ICON_ENTITY_EMPTY")
        case .Player:
            tile.name = "PLAYER"
            tile.power = 0
            tile.texture = SKTexture(imageNamed: "ICON_ENTITY_PLAYER")
        case .Portal:
            tile.name = "PORTAL"
            tile.power = 0
            tile.texture = SKTexture(imageNamed: "ICON_ENTITY_PORTAL")
        case .Enemy:
            tile.name = "ENEMY"
            tile.texture = SKTexture(imageNamed: "ICON_ENEMY_"+String(tile.power))
        case .Sword:
            tile.name = "SWORD"
            tile.texture = SKTexture(imageNamed: "ICON_SWORD_"+String(tile.power))
        case .Shield:
            tile.name = "SHIELD"
            tile.texture = SKTexture(imageNamed: "ICON_SHIELD_"+String(tile.power))
        case .Potion:
            tile.name = "POTION"
            tile.texture = SKTexture(imageNamed: "ICON_POTION_"+String(tile.power))
        case .Coin:
            tile.name = "COIN"
            tile.texture = SKTexture(imageNamed: "ICON_COIN_"+String(tile.power))
        case .Shop:
            tile.name = "SHOP"
            tile.texture = SKTexture(imageNamed: "ICON_ENTITY_SHOP")
        case .Temple:
            tile.name = "TEMPLE"
            tile.texture = SKTexture(imageNamed: "ICON_ENTITY_TEMPLE")
        case .Boss:
            tile.name = "BOSS"
            tile.texture = SKTexture(imageNamed: "ICON_ENEMY_8")
        }
    }
    //MARK: - Tile / other
    func adjacentTilesTo(x:Int, y:Int) -> [Tile?]{
        var tileR:Tile = Tile()
        tileR.name = "EMPTY"
        var tileL:Tile = Tile()
        tileL.name = "EMPTY"
        var tileU:Tile = Tile()
        tileU.name = "EMPTY"
        var tileD:Tile = Tile()
        tileD.name = "EMPTY"
        //check right tile
        if x != 5{
            let right = nodes(at: CGPoint(x: locations[0][x+1], y: locations[1][y]))
            tileR = right[0] as! Tile
        }
        if x != 1{
            let left = nodes(at: CGPoint(x: locations[0][x-1], y: locations[1][y]))
            tileL = left[0] as! Tile
        }
        if y != 5{
            let up = nodes(at: CGPoint(x: locations[0][x], y: locations[1][y+1]))
            tileU = up[0] as! Tile
        }
        if y != 1{
            let down = nodes(at: CGPoint(x: locations[0][x], y: locations[1][y-1]))
            tileD = down[0] as! Tile
        }
        return [tileR, tileL, tileU, tileD]
    }
    //This function defines the locations of every tile in the scene.
    func gridLocations() -> [Array<CGFloat>]{
        var posX = [CGFloat](repeating: CGFloat(17), count: 6)
        var posY = [CGFloat](repeating: CGFloat(17), count: 6)
        
        for i in 1...5{
            posX[i] = CGFloat(posX[0]*CGFloat(i))
            for j in 1...5{
                posY[j] = CGFloat(posY[0]*CGFloat(j))
            }
        }
        
        return [posX, posY]
    }
  
}
