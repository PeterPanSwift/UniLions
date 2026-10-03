import SwiftUI

struct TeamStoryView: View {
    let imageName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            TeamSectionHeading(number: "01", eyebrow: "OUR STORY", title: "始終如一的獅子軍。")

            Text("從職棒元年到今天，橘色始終是台南最熱血的風景。")
                .font(.subheadline)
                .foregroundStyle(LionsTheme.muted)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .accessibilityLabel("統一獅 2026 年球隊主視覺，獅子軍球員合影")

            VStack(alignment: .leading, spacing: 17) {
                HStack(spacing: 6) {
                    Text("ONE TEAM. ONE CITY.")
                        .font(.system(.caption2, weight: .heavy))
                        .tracking(1.5)
                    Spacer()
                    Image(systemName: "baseball.fill")
                        .foregroundStyle(LionsTheme.orange)
                }

                Text("1989 年成立，1990 年踏上中華職棒賽場。身為聯盟創始球隊之一，統一獅一路深耕台南，將對棒球的堅持，化成每一代球迷共同的記憶。")
                    .font(.subheadline)
                    .foregroundStyle(LionsTheme.muted)
                    .lineSpacing(6)
                    .fixedSize(horizontal: false, vertical: true)

                Rectangle().fill(LionsTheme.line).frame(height: 1)

                SymbolFeatureView(symbol: "flag.fill", title: "從第一場勝利開始", subtitle: "1990 年中職開幕戰，獅隊以 4：3 拿下聯盟史上首勝。")
            }
            .padding(20)
            .modifier(LionsCardStyle())
        }
    }
}
