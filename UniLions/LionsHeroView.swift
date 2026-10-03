import SwiftUI

struct LionsHeaderView: View {
    @AppStorage("isUniLionsFavorite") private var isFavorite = false

    var body: some View {
        HStack(spacing: 10) {
            Image("LionsLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 48)
                .accessibilityLabel("統一獅隊徽")

            VStack(alignment: .leading, spacing: 2) {
                Text("UNILIONS")
                    .font(.system(size: 22, weight: .black, design: .rounded))
                    .italic()
                    .tracking(-1)
                Text("TAINAN  ·  BASEBALL")
                    .font(.system(size: 8, weight: .semibold))
                    .tracking(2)
                    .foregroundStyle(LionsTheme.muted)
            }

            Spacer(minLength: 12)

            Button {
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(isFavorite ? LionsTheme.orange : LionsTheme.ink)
                    .frame(width: 44, height: 44)
                    .background(.white.opacity(0.8), in: Circle())
                    .overlay { Circle().strokeBorder(LionsTheme.line, lineWidth: 1) }
            }
            .buttonStyle(.plain)
            .accessibilityLabel(isFavorite ? "取消收藏統一獅" : "收藏統一獅")
            .accessibilityValue(isFavorite ? "已收藏" : "尚未收藏")
            .accessibilityIdentifier("favoriteButton")
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 10)
        .frame(maxWidth: 760)
        .frame(maxWidth: .infinity)
        .background(LionsTheme.paper)
        .overlay(alignment: .bottom) {
            Rectangle().fill(LionsTheme.line).frame(height: 1)
        }
    }
}

/// The hero can be reused with a different asset and headline.
struct LionsHeroView: View {
    let imageName: String
    let eyebrow: LocalizedStringResource
    let title: LocalizedStringResource
    let subtitle: LocalizedStringResource

    var body: some View {
        VStack(alignment: .leading, spacing: 19) {
            HStack(spacing: 7) {
                Circle().fill(LionsTheme.orange).frame(width: 5, height: 5)
                Text(eyebrow)
                    .font(.system(.caption2, weight: .bold))
                    .tracking(2.5)
                Spacer()
                Text("EST. 1990")
                    .font(.system(.caption2, design: .monospaced, weight: .medium))
                    .foregroundStyle(LionsTheme.muted)
            }
            .foregroundStyle(LionsTheme.orange)

            VStack(alignment: .leading, spacing: 2) {
                Text("統一獅")
                    .foregroundStyle(LionsTheme.ink)
                Text("台南的驕傲。")
                    .foregroundStyle(LionsTheme.orange)
            }
            .font(.system(size: 39, weight: .heavy))
            .tracking(-1.6)
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isHeader)

            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(LionsTheme.ink)
                    .overlay {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipped()

                LinearGradient(
                    stops: [
                        .init(color: .black.opacity(0.04), location: 0),
                        .init(color: .black.opacity(0.05), location: 0.35),
                        .init(color: LionsTheme.ink.opacity(0.93), location: 1)
                    ],
                    startPoint: .top, endPoint: .bottom
                )

                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 5) {
                        Image(systemName: "baseball.fill")
                        Text("統一7-ELEVEn獅")
                    }
                    .font(.system(.caption, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.85))

                    Text(title)
                        .font(.system(.title2, weight: .heavy))
                        .tracking(-0.8)
                        .foregroundStyle(.white)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))

                    HStack(spacing: 5) {
                        Image(systemName: "mappin.and.ellipse")
                        Text("TAINAN, TAIWAN")
                            .tracking(1.6)
                    }
                    .font(.system(size: 9, weight: .bold))
                    .foregroundStyle(LionsTheme.gold)
                    .padding(.top, 5)
                }
                .padding(22)
            }
            .frame(height: 310)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(alignment: .topTrailing) {
                Text("2026\nSEASON")
                    .font(.system(size: 10, weight: .heavy, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(LionsTheme.orange, in: RoundedRectangle(cornerRadius: 13))
                    .padding(16)
            }
            .shadow(color: LionsTheme.ink.opacity(0.12), radius: 16, x: 0, y: 8)
            .accessibilityElement(children: .combine)
            .accessibilityLabel("亞太成棒主球場。統一7-ELEVEn獅，獅心不滅，榮耀同行。")
        }
    }
}
