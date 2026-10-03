import SwiftUI

enum LionsTheme {
    static let paper = Color(red: 0.97, green: 0.96, blue: 0.93)
    static let ink = Color(red: 0.10, green: 0.14, blue: 0.12)
    static let orange = Color(red: 0.88, green: 0.29, blue: 0.09)
    static let muted = Color(red: 0.40, green: 0.43, blue: 0.40)
    static let line = Color(red: 0.87, green: 0.87, blue: 0.82)
    static let gold = Color(red: 0.94, green: 0.75, blue: 0.39)
}

enum TeamSection: String, CaseIterable, Identifiable {
    case story, honors, stadium

    var id: Self { self }

    var title: LocalizedStringResource {
        switch self {
        case .story: "球隊故事"
        case .honors: "榮耀時刻"
        case .stadium: "主場巡禮"
        }
    }

    var symbol: String {
        switch self {
        case .story: "baseball"
        case .honors: "trophy"
        case .stadium: "mappin.and.ellipse"
        }
    }
}

enum LionsFacts {
    // Official team history: https://www.uni-lions.com.tw/about/field
    static let championshipYears = [1991, 1995, 1996, 2000, 2007, 2008, 2009, 2011, 2013, 2020]
    static let officialWebsite = URL(string: "https://www.uni-lions.com.tw/")!
    static let schedule = URL(string: "https://www.uni-lions.com.tw/schedule")!
    static let stadium = URL(string: "https://www.uni-lions.com.tw/about/field")!
}

struct LionsCardStyle: ViewModifier {
    var fill: Color = .white
    var radius: CGFloat = 24

    func body(content: Content) -> some View {
        content
            .background(fill, in: RoundedRectangle(cornerRadius: radius))
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .strokeBorder(LionsTheme.line.opacity(0.65), lineWidth: 1)
            }
    }
}
