import SwiftUI

/// Customize a reusable section heading through its text properties.
struct TeamSectionHeading: View {
    let number: String
    let eyebrow: LocalizedStringResource
    let title: LocalizedStringResource

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack(spacing: 8) {
                Text(number)
                    .font(.system(.caption, design: .monospaced, weight: .semibold))
                Rectangle().frame(width: 22, height: 1)
                Text(eyebrow)
                    .font(.system(.caption2, weight: .bold))
                    .tracking(2)
            }
            .foregroundStyle(LionsTheme.orange)

            Text(title)
                .font(.system(.title2, weight: .heavy))
                .tracking(-0.7)
                .accessibilityAddTraits(.isHeader)
        }
    }
}

struct TeamStatView: View {
    let value: String
    let label: LocalizedStringResource
    let symbol: String

    var body: some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.system(size: 27, weight: .heavy, design: .rounded))
                .minimumScaleFactor(0.7)
                .lineLimit(1)
            HStack(spacing: 4) {
                Image(systemName: symbol)
                    .foregroundStyle(LionsTheme.orange)
                Text(label)
            }
            .font(.caption2)
            .foregroundStyle(LionsTheme.muted)
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }
}

struct TeamStatsView: View {
    var body: some View {
        HStack(spacing: 8) {
            TeamStatView(value: "1990", label: "職棒元年", symbol: "baseball.fill")
            Rectangle().fill(LionsTheme.line).frame(width: 1, height: 34)
            TeamStatView(value: "10", label: "總冠軍榮耀", symbol: "trophy.fill")
            Rectangle().fill(LionsTheme.line).frame(width: 1, height: 34)
            TeamStatView(value: "台南", label: "城市主場", symbol: "mappin.circle.fill")
        }
        .padding(.vertical, 6)
    }
}

struct SectionNavigationView: View {
    let onSelect: (TeamSection) -> Void

    var body: some View {
        HStack(spacing: 8) {
            ForEach(TeamSection.allCases) { section in
                Button {
                    onSelect(section)
                } label: {
                    HStack(spacing: 5) {
                        Text(section.title)
                            .font(.system(.caption, weight: .semibold))
                        Image(systemName: "arrow.down")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundStyle(LionsTheme.orange)
                    }
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(.white.opacity(0.72), in: Capsule())
                    .overlay {
                        Capsule().strokeBorder(LionsTheme.line, lineWidth: 1)
                    }
                    .contentShape(Capsule())
                }
                .buttonStyle(.plain)
                .accessibilityHint("跳到這個介紹章節")
            }
        }
    }
}

struct SymbolFeatureView: View {
    let symbol: String
    let title: LocalizedStringResource
    let subtitle: LocalizedStringResource

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: symbol)
                .font(.system(size: 19, weight: .medium))
                .foregroundStyle(LionsTheme.orange)
                .frame(width: 42, height: 42)
                .background(LionsTheme.orange.opacity(0.08), in: RoundedRectangle(cornerRadius: 13))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.system(.subheadline, weight: .bold))
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(LionsTheme.muted)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
