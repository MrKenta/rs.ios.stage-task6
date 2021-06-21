//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        guard let playersCards = hand else { return false }
        
        for playerCard in playersCards {
        
            if playerCard.value == card.value {
                return true
            }
        }
        
         return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        
        if table.isEmpty {
            return false
        }
        
        guard let playerCards = hand else { return false }
        
        for cards in table {
            for playersCard in playerCards {
                if  cards.value.value == playersCard.value || cards.key.value == playersCard.value  {
                    return true
                }
            }
        }
        return false
    }
}
