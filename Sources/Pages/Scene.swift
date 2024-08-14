import Foundation

import Slipstream

struct Scene<Content: View>: View {
  init(
    path: String,
    title: String? = nil,
    description: String? = nil,
    showsFireworks: Bool = false,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.path = path
    self.title = title
    self.description = description
    self.showsFireworks = showsFireworks
    if showsFireworks {
      self.additionalStylesheets = [URL(string: "/css/fireworks.css")]
    } else {
      self.additionalStylesheets = []
    }
    self.content = content
  }

  var body: some View {
    Page(
      path: path,
      title: title,
      description: description,
      backgroundColor: Color(.sky, darkness: 100),
      darkModeBackgroundColor: Color(.sky, darkness: 950),
      additionalStylesheets: additionalStylesheets + [URL(string: "/css/parallax.css")]
    ) {
      Div {
        if showsFireworks {
          Div {
            Div {}.className("firework")
            Div {}.className("firework")
            Div {}.className("firework")
            Div {}.className("firework")
            Div {}.className("firework")
          }
        }
        Container {
          VStack(alignment: .center, spacing: 16) {
            H1("Hog Mobile")
              .fontSize(.sixXLarge)
              .fontSize(.nineXLarge, condition: .startingAt(.medium))
              .fontWeight(.black)
              .fontDesign("rounded")
              .textColor(.rose, darkness: 500)
              .textColor(.rose, darkness: 400, condition: .dark)
              .className("text-extrude shadow-rose-900")
              .className("md:text-extrude-lg")
              .fontLeading(.tight)

            Paragraph {
              Link("PostHog", destination: URL(string: "https://posthog.com"))
                .underline(condition: .hover)
              DOMString(" analytics on the go!")
            }
            .fontSize(.extraExtraLarge)
            .fontSize(.fiveXLarge, condition: .startingAt(.medium))
            .fontWeight(.black)
            .fontDesign("rounded")
            .textColor(.rose, darkness: 500)
            .textColor(.rose, darkness: 400, condition: .dark)

            content()
          }
          .flexGap(.y, width: 48, condition: .startingAt(.medium))
          .textAlignment(.center)
        }
        .padding(.vertical, 32)
        .frame(minHeight: 500)
        .className("h-[75lvh]")
        .className("min-h-[350pt]")
        .className("md:min-h-[450pt]")

        // The ground
        Div {
          Div {
            Div {}.className("shape circle")
              .background(.green, darkness: 600)
              .background(.green, darkness: 950, condition: .dark)
            Div {}.className("shape circle")
              .background(.green, darkness: 500)
              .background(.green, darkness: 900, condition: .dark)
            Div {}.className("shape circle")
              .background(.green, darkness: 400)
              .background(.green, darkness: 800, condition: .dark)
            Div {}.className("shape circle")
              .background(.green, darkness: 300)
              .background(.green, darkness: 700, condition: .dark)
            Div {}.className("shape circle")
              .background(.green, darkness: 300)
              .background(.green, darkness: 700, condition: .dark)
          }
          Div {
            // The hog mobile
            Div {
              HogMobile()
            }
            .position(.absolute)
            .placement(left: 0.5, top: 0)
            .offset(x: -0.5, y: -0.5)
          }
          .frame(width: .full, height: .full)
          .background(.slate, darkness: 400)
          .background(.slate, darkness: 700, condition: .dark)
        }
        .className("overflow-x-clip")
        .frame(width: .full)
        .className("h-[25lvh]")
        .position(.relative)
      }
    }
  }

  private let path: String
  private let title: String?
  private let description: String?
  private let showsFireworks: Bool
  private let additionalStylesheets: [URL?]
  @ViewBuilder private let content: () -> Content
}
