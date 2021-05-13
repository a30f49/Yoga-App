import Firebase

extension Live {
    static func build(from documents: [QueryDocumentSnapshot]) -> [Live] {
        var lives = [Live]()
        for document in documents {
            lives.append(Live(identifier: document["id"] as? String ?? "",
                              liveActive: document["liveActive"] as? Bool ?? false,
                              title: document["title"] as? String ?? "",
                              liveURL: document["liveURL"] as? String ?? "",
                              dateLive: (document["date"] as? Timestamp)?.dateValue() ?? Date()
            ))
        }
        return lives
    }
}
