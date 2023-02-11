//
//  ListView.swift
//  CatalogOnline
//
//  Created by Mihai Cerneanu on 10.02.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class WelcomeViewModel: ObservableObject {
    @Published var students: [Student] = []
    
    init() {
        fetchStudents()
    }
    
    func fetchStudents() {
        students.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Students")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    
                    let student = Student(id: id, name: name)
                    self.students.append(student)
                }
            }
        }
    }
}
