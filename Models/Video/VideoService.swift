import Firebase

class VideoService {
    let database = Firestore.firestore()

    func get(collectionID: String, handler: @escaping ([Video]) -> Void) {
        database.collection("Video")
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(Video.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
}
