//
//  ContentView.swift
//  Shared
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import SwiftUI
import CoreData

struct ContentView: View   {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        List {
            ForEach(items) { item in
                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            #if os(iOS)
            EditButton()
            #endif

            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
        }
        NavigationView {
            VStack{
                NavigationLink(
                    destination: testServiceView()) {
                    Text("Submit")
                }.navigationBarTitle("FirstView", displayMode: .inline)
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct testServiceView: View {
    
    @State private var interactor: ChatInteractor = ChatInteractor()
    private var appState: AppState {
        get {
            return self.interactor.appState
        }
    }
    
    var body: some View {
        Text("Main Title")
            .onAppear() {
                self.interactor.setCurrentMesssage()
                print("First Message: \(self.appState.currentMessage?.text ?? "")")
                self.interactor.setNextMessagesFrom(id: self.appState.currentMessage?.id ?? 0)
                print("Choose an option: ")
                appState.nextMessages.forEach { msg in
                    print("() \(msg.text)")
                }
            }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
