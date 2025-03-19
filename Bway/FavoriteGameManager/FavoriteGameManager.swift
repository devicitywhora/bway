//
//  FavoriteGameManager.swift
//  Bway
//
//  Created by D K on 17.03.2025.
//

import Foundation
import RealmSwift

class FavoriteGame: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var title: String
    @Persisted var gameplay: String?
    @Persisted var basicRules: String?
    @Persisted var image: String?
    @Persisted var isComplete: Bool = false
}

class FavoriteGameManager {
    
    static let shared = FavoriteGameManager()
    private var realm: Realm
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    
    func removeAllFavoriteGames() {
        let allFavoriteGames = realm.objects(FavoriteGame.self)
        do {
            try realm.write {
                realm.delete(allFavoriteGames)
            }
        } catch {
            print("Failed to delete all favorite games: \(error)")
        }
    }
    
    func addGameToFavorites(game: DataModel) {
        let favoriteGame = FavoriteGame()
        favoriteGame.id = game.id
        favoriteGame.title = game.title
        favoriteGame.gameplay = game.gameplay
        favoriteGame.basicRules = game.basicRules
        favoriteGame.image = game.image
        favoriteGame.isComplete = game.isComplet
        
        do {
            try realm.write {
                realm.add(favoriteGame, update: .modified)
            }
        } catch {
            print("Failed to add game to favorites: \(error)")
        }
    }
    
    func removeGameFromFavorites(gameTitle: String) {
        if let gameToDelete = realm.objects(FavoriteGame.self).filter("title == %@", gameTitle).first {
            do {
                try realm.write {
                    realm.delete(gameToDelete)
                }
            } catch {
                print("Failed to delete game from favorites: \(error)")
            }
        }
    }
    
    func getAllFavoriteGames() -> [DataModel] {
        let favoriteGames = realm.objects(FavoriteGame.self)
        return favoriteGames.map { game in
            DataModel(
                id: game.id,
                title: game.title,
                gameplay: game.gameplay,
                basicRules: game.basicRules,
                image: game.image,
                isComplet: game.isComplete
            )
        }
    }
    
    func isGameFavorite(gameTitle: String) -> Bool {
        return realm.objects(FavoriteGame.self).filter("title == %@", gameTitle).count > 0
    }
}
