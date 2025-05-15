//
//  AppDatabase.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 11/05/25.
//
import SwiftData

class AppDatabase {
    
    let modelContainer : ModelContainer
    
    @MainActor
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(
        for modelTypes: [any PersistentModel.Type],
        isStoredInMemoryOnly: Bool = false,
        configurationName: String = "CrudPersonaMvvmIosBd",
        allowsSave: Bool = true,
        enablesCloudKit: Bool = false,
        groupContainer: ModelConfiguration.GroupContainer = .none,
        cloudKitDb: ModelConfiguration.CloudKitDatabase = .none
    ) {
        
        let schema = Schema(modelTypes)
        
        let configurations = ModelConfiguration(
            configurationName,
            schema: schema,
            isStoredInMemoryOnly: isStoredInMemoryOnly,
            allowsSave: allowsSave,
            groupContainer: groupContainer,
            cloudKitDatabase: cloudKitDb
        )
        
        do {
            self.modelContainer = try ModelContainer(for: schema, configurations: configurations)
        } catch {
            fatalError("Unable to initialize the ModelContainer: \(error)")
        }
        
        
    }
}
