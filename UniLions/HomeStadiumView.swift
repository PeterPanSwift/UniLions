import SwiftUI

struct HomeStadiumView: View {
    let imageName: String
    let name: LocalizedStringResource
    let description: LocalizedStringResource

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            TeamSectionHeading(number: "03", eyebrow: "THIS IS HOME", title: "我們的主場，台南。")

            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .fill(LionsTheme.ink)
                    .frame(height: 205)
                    .overlay {
                        Image(imageName).resizable().scaledToFill()
                    }
                    .clipped()
                    .accessibilityLabel("亞太成棒主球場的草地與觀眾看台")

                VStack(alignment: .leading, spacing: 17) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("TAINAN / 2026")
                                .font(.system(.caption2, design: .monospaced, weight: .bold))
                                .tracking(1)
                                .foregroundStyle(LionsTheme.orange)
                            Text(name).font(.system(.title3, weight: .heavy))
                        }
                        Spacer()
                        Image(systemName: "mappin.and.ellipse")
                            .font(.title2)
                            .foregroundStyle(LionsTheme.orange)
                            .padding(10)
                            .background(LionsTheme.paper, in: Circle())
                    }

                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(LionsTheme.muted)
                        .lineSpacing(5)
                        .fixedSize(horizontal: false, vertical: true)

                    HStack(spacing: 8) {
                        StadiumDistanceView(title: "左外野", distance: "330")
                        StadiumDistanceView(title: "中外野", distance: "400")
                        StadiumDistanceView(title: "右外野", distance: "330")
                    }

                    Link(destination: LionsFacts.stadium) {
                        HStack {
                            Text("認識亞太主場")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                        }
                        .font(.system(.subheadline, weight: .bold))
                        .foregroundStyle(LionsTheme.orange)
                        .frame(minHeight: 44)
                    }
                }
                .padding(20)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay {
                RoundedRectangle(cornerRadius: 24).strokeBorder(LionsTheme.line.opacity(0.65), lineWidth: 1)
            }
        }
    }
}

struct StadiumDistanceView: View {
    let title: LocalizedStringResource
    let distance: String

    var body: some View {
        VStack(spacing: 5) {
            Text(title).font(.caption2).foregroundStyle(LionsTheme.muted)
            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text(distance).font(.system(.title3, design: .rounded, weight: .bold))
                Text("ft").font(.caption2).foregroundStyle(LionsTheme.muted)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(LionsTheme.paper, in: RoundedRectangle(cornerRadius: 12))
        .accessibilityElement(children: .combine)
    }
}
