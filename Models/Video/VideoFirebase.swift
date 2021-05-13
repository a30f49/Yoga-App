import Firebase

extension Video {
    static func build(from documents: [QueryDocumentSnapshot]) -> [Video] {
        var videos = [Video]()
        for document in documents {
            videos.append(Video(videoURL: document["videoURL"] as? String ?? "",
                                title:  document["title"] as? String ?? "",
                                duration: document["duration"] as? Double ?? 0.0,
                                imageURL: document["imageURL"] as? String ?? "",
                                category: document["category"] as? String ?? ""
                                ))
        }
        return videos
    }
}
