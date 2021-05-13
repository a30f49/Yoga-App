import Firebase

class LiveService {
    let database = Firestore.firestore()

    func get(collectionID: String, handler: @escaping ([Live]) -> Void) {
        database.collection("Live")
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(Live.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
}
