//
//  Tile.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 2/3/23.
//

import Foundation
import SpriteKit

enum EntityType: CaseIterable{
    case Empty
    case Player
    case Portal
    case Enemy
    case Sword
    case Shield
    case Potion
    case Coin
    case Shop
    case Temple
    case Boss
}
class Tile: SKSpriteNode, Identifiable{
    var type:EntityType = EntityType.Empty
    var power:Int = 0
    var x:Int = 0
    var y:Int = 0
}
