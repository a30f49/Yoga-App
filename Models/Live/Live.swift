import Foundation

struct Live {
    let identifier: String
    let liveActive: Bool
    let title: String?
    let liveURL: String?
    let dateLive: Date
    var dateString: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE, dd 'of' MMMM"
           return formatter.string(from: dateLive)
       }
}

extension Live: Equatable, Hashable {}
