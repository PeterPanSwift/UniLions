import SwiftUI

struct TeamHonorsView: View {
    let championshipYears: [Int]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            TeamSectionHeading(number: "02", eyebrow: "BUILT FOR GLORY", title: "榮耀，刻進隊史。")

            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .center, spacing: 14) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(championshipYears.count)")
                            .font(.system(size: 78, weight: .heavy, design: .rounded))
                            .tracking(-4)
                            .foregroundStyle(LionsTheme.gold)
                        Text("座年度總冠軍")
                            .font(.system(.subheadline, weight: .bold))
                    }

                    Spacer(minLength: 0)

                    ZStack {
                        Circle().strokeBorder(LionsTheme.gold.opacity(0.18), lineWidth: 1)
                            .frame(width: 100, height: 100)
                        Circle().strokeBorder(LionsTheme.gold.opacity(0.12), lineWidth: 1)
                            .frame(width: 78, height: 78)
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 37))
                            .foregroundStyle(LionsTheme.gold)
                    }
                    .accessibilityHidden(true)
                }

                Rectangle().fill(.white.opacity(0.15)).frame(height: 1)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 55), spacing: 8)], spacing: 8) {
                    ForEach(championshipYears, id: \.self) { year in
                        Text(verbatim: String(year))
                            .font(.system(.caption, design: .monospaced, weight: .bold))
                            .foregroundStyle(LionsTheme.gold)
                            .frame(maxWidth: .infinity, minHeight: 32)
                            .background(.white.opacity(0.07), in: RoundedRectangle(cornerRadius: 7))
                    }
                }

                HStack(spacing: 6) {
                    Image(systemName: "star.fill")
                    Text("每一個年份，都是一代人的感動。")
                }
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
            }
            .foregroundStyle(.white)
            .padding(24)
            .background(LionsTheme.ink, in: RoundedRectangle(cornerRadius: 24))

            VStack(spacing: 0) {
                TeamMilestoneRow(year: "1991", title: "第一座總冠軍", detail: "獅子軍的冠軍故事，從這裡開始。", isLast: false)
                TeamMilestoneRow(year: "2007–09", title: "三連霸王朝", detail: "連續三年封王，寫下猛獅傳奇。", isLast: false)
                TeamMilestoneRow(year: "2020", title: "逆境中的第十冠", detail: "從 1 勝 3 敗到逆轉奪冠，永不放棄。", isLast: true)
            }
            .padding(20)
            .modifier(LionsCardStyle())
        }
    }
}

struct TeamMilestoneRow: View {
    let year: String
    let title: LocalizedStringResource
    let detail: LocalizedStringResource
    let isLast: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(spacing: 5) {
                Circle()
                    .fill(LionsTheme.orange)
                    .frame(width: 8, height: 8)
                Rectangle()
                    .fill(isLast ? .clear : LionsTheme.line)
                    .frame(width: 1)
            }
            .padding(.top, 5)

            VStack(alignment: .leading, spacing: 5) {
                Text(year)
                    .font(.system(.caption2, design: .monospaced, weight: .bold))
                    .foregroundStyle(LionsTheme.orange)
                Text(title).font(.system(.subheadline, weight: .bold))
                Text(detail)
                    .font(.caption)
                    .foregroundStyle(LionsTheme.muted)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.bottom, isLast ? 0 : 22)
            Spacer(minLength: 0)
        }
        .fixedSize(horizontal: false, vertical: true)
        .accessibilityElement(children: .combine)
    }
}
