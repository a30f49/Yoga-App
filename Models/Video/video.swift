struct Video {
    let videoURL: String?
    let title: String?
    let duration: Double
    let imageURL: String
    let category: String
}

extension Video: Equatable, Hashable {}
