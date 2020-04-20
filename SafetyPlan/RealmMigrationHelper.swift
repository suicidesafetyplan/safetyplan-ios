//
//  RealmMigrationHelper.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/18/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

/// Data structure to represent any a single realm DB migration
struct RealmMigration {
    /// The text description of the migration to be run
    var description: String
    /// The new version to migrate the database to
    var version: UInt64
    /// An optional completion for more complex migrations
    var migrationCompletion: VoidCompletion?
}

class RealmMigrationHelper {
    
    /// Collection of migrations to attepmt to be run when the app loads
    /// NOTE FOR DEVELOPERS:
    /// Here is where all new migrations must go. Everytime we update any of the already existing Realm data object structures, or add new ones,
    /// it is important that we add a migration here to track the changes, and make sure the app is migrated properly.
    /// When adding a new migration, please add a description, startging with your initials in brackets "[ST]" followed by a short description of the change being made
    /// It is also important that you increment the version # by one for every new migration
    static var migrations: [RealmMigration] {
        return [
            RealmMigration(description: "[ST] Initial Realm Migration", version: 1)
        ]
    }
    
    /// Checks to see if there are any needed migration, then runs the available new ones
    /// This method should be called only once from the "application(application:didFinishLaunchingWithOptions:)" method in AppDelegate.swift
    static func runMigationsIfNeeded() {
        let sortedMigrations = RealmMigrationHelper.migrations.sorted(by: { $0.version > $1.version })
        guard let newestVersion = sortedMigrations.first?.version else { return }
        
        let config = Realm.Configuration(schemaVersion: newestVersion,
                                         migrationBlock: { migration, oldSchemaVersion in
                                            for realmMigration in sortedMigrations {
                                                if oldSchemaVersion < realmMigration.version {
                                                    realmMigration.migrationCompletion?()
                                                }
                                            }
        })
        
        Realm.Configuration.defaultConfiguration = config
        
        guard let _ = try? Realm() else { fatalError("Unable to successfully run migration") }
    }
    
}
