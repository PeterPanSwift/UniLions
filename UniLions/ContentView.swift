import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        ZStack {
            LionsTheme.paper.ignoresSafeArea()

            ScrollViewReader { proxy in
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 30) {
                        LionsHeroView(
                            imageName: "LionsStadium",
                            eyebrow: "PRIDE OF TAINAN",
                            title: "獅心不滅，榮耀同行。",
                            subtitle: "一座城市的熱情，一支球隊的信念。"
                        )

                        TeamStatsView()

                        SectionNavigationView { section in
                            withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.4)) {
                                proxy.scrollTo(section, anchor: .top)
                            }
                        }

                        TeamStoryView(imageName: "LionsTeam")
                            .id(TeamSection.story)

                        TeamHonorsView(championshipYears: LionsFacts.championshipYears)
                            .id(TeamSection.honors)

                        HomeStadiumView(
                            imageName: "LionsStadium",
                            name: "亞太成棒主球場",
                            description: "熟悉的台南，全新的主場。2026 年，獅子軍在亞太成棒主球場展開新篇章，讓每一次吶喊都有更遼闊的舞台。"
                        )
                        .id(TeamSection.stadium)

                        FanCultureView(
                            title: "把熱愛，喊成主場。",
                            description: "穿上橘色，跟著 UniGirls 的節奏，和萊恩一起為每一次安打、每一個出局歡呼。你也能成為獅子軍的一分子。"
                        )

                        LionsFooterView()
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 24)
                    .padding(.bottom, 28)
                    .frame(maxWidth: 760)
                    .frame(maxWidth: .infinity)
                }
                .scrollIndicators(.hidden)
                .safeAreaInset(edge: .top, spacing: 0) {
                    LionsHeaderView()
                }
            }
        }
        .foregroundStyle(LionsTheme.ink)
        .tint(LionsTheme.orange)
        .preferredColorScheme(.light)
    }
}

#Preview("統一獅・球隊介紹") {
    ContentView()
}
