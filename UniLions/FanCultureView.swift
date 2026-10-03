import SwiftUI

struct FanCultureView: View {
    let title: LocalizedStringResource
    let description: LocalizedStringResource

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            TeamSectionHeading(number: "04", eyebrow: "ALL TOGETHER", title: title)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(LionsTheme.muted)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)

            VStack(alignment: .leading, spacing: 20) {
                SymbolFeatureView(symbol: "music.note", title: "UniGirls・熱力應援", subtitle: "每一拍節奏，都是看台上的團結。")
                SymbolFeatureView(symbol: "pawprint.fill", title: "萊恩・最暖的獅隊夥伴", subtitle: "從場邊到看台，把笑容傳給每一位球迷。")
                SymbolFeatureView(symbol: "hands.clap.fill", title: "橘色看台・一起吶喊", subtitle: "無論領先或落後，都陪獅子軍走到最後。")
            }
            .padding(20)
            .modifier(LionsCardStyle())
        }
    }
}

struct LionsFooterView: View {
    var body: some View {
        VStack(spacing: 22) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("SEE YOU AT THE BALLPARK")
                        .font(.system(size: 9, weight: .heavy))
                        .tracking(1.4)
                    Spacer(minLength: 0)
                    Image(systemName: "baseball.fill").font(.title3)
                }
                .foregroundStyle(.white.opacity(0.78))

                Text("下一次，\n一起在看台見。")
                    .font(.system(.title, weight: .heavy))
                    .tracking(-1)
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)

                Link(destination: LionsFacts.schedule) {
                    HStack {
                        Text("查看官方賽程")
                        Spacer()
                        Image(systemName: "arrow.up.right")
                    }
                    .font(.system(.subheadline, weight: .bold))
                    .foregroundStyle(LionsTheme.ink)
                    .padding(.horizontal, 18)
                    .frame(minHeight: 50)
                    .background(LionsTheme.paper, in: Capsule())
                }
            }
            .padding(24)
            .background(LionsTheme.orange, in: RoundedRectangle(cornerRadius: 24))

            VStack(spacing: 10) {
                Link(destination: LionsFacts.officialWebsite) {
                    HStack(spacing: 5) {
                        Text("統一獅官方網站")
                        Image(systemName: "arrow.up.right")
                    }
                    .font(.system(.caption, weight: .semibold))
                    .frame(minHeight: 44)
                }
                Text("球隊介紹練習作品 · 非官方 App\n資料與圖片來源：統一獅官方網站\n1989 年成立資料：國立臺灣歷史博物館")
                    .font(.system(size: 10))
                    .foregroundStyle(LionsTheme.muted)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
        }
    }
}
