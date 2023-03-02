//
//  Item.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 28/2/23.
//

import Foundation
import SwiftUI

enum ItemType: CaseIterable{
    case SWORD
    case SHIELD
    case POTION
    case GREENP
    case RERROLL
    case BOMB
    case MAXH
    case FULLH
    case SLOT
    case NONE
}

class Item: Identifiable, ObservableObject{
    var type:ItemType {
        willSet {
            objectWillChange.send()
        }
    }
    var price:Int {
        willSet {
            objectWillChange.send()
        }
    }
    var power:Int {
        willSet {
            objectWillChange.send()
        }
    }
    init(nType:ItemType, nPrice:Int, nPower:Int) {
        type = nType
        power = nPower
        price = nPrice
        switch type {
        case ItemType.SWORD:
            sprite = Image("ICON_SWORD_\(power)")
        case ItemType.SHIELD:
            sprite = Image("ICON_SHIELD_\(power)")
        case ItemType.POTION:
            sprite = Image("ICON_POTION_\(power)")
        case ItemType.GREENP:
            sprite = Image("ICON_C_GREENP")
        case ItemType.RERROLL:
            sprite = Image("ICON_C_RERROLL")
        case ItemType.BOMB:
            sprite = Image("ICON_C_BOMB")
        case .NONE:
            sprite = Image("ICON_ENTITY_EMPTY")
        case .MAXH:
            sprite = Image("ICON_C_MAXHEALTH")
        case .FULLH:
            sprite = Image("ICON_C_FULLHEAL")
        case .SLOT:
            sprite = Image("ICON_C_SLOT")
        }
    }
    var sprite:Image = Image("ICON_ENTITY_EMPTY")
    func empty() {
        print("emptied object")
        type = ItemType.NONE
        price = 0
        power = 0
        sprite = Image("ICON_ENTITY_EMPTY")
    }

}
