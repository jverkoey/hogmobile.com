import Foundation

import Slipstream

struct HogImage: View {
  let url: URL?

  init(_ url: URL?) {
    self.url = url
  }

  var body: some View {
    Image(url)
      .position(.absolute)
  }
}

struct Home: View {
  var body: some View {
    Page(
      path: "/",
      description: "PostHog analytics natively on iOS",
      backgroundColor: Color(.sky, darkness: 100),
      darkModeBackgroundColor: Color(.sky, darkness: 950)
    ) {
      Div {
        // The ground
        Div {}
        .position(.absolute)
        .background(.gray, darkness: 400)
        .background(.gray, darkness: 700, condition: .dark)
        .frame(width: .full, height: 0.333)
        .placement(left: 0, bottom: 0)

        // The hog mobile
        Div {
          hogmobile
        }
        .position(.absolute)
        .placement(left: 0.5, bottom: 0.25)
        .offset(x: -0.5)
        .offset(y: 64, condition: .startingAt(.medium))

        content
      }
      .frame(height: .lvh)
      .frame(minHeight: 384, height: .screen, condition: .startingAt(.medium))
      .position(.relative)
    }
  }

  @ViewBuilder
  private var content: some View {
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

        Link(URL(string: "/")) {
          Span("Sign up for the beta")
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .display(.block)
            .background(.rose, darkness: 500)
            .background(.rose, darkness: 400, condition: .dark)
            .offset(y: -8)
            .offset(y: -6, condition: .hover)
            .offset(y: -2, condition: .active)
            .animation(.easeInOut, condition: .hover + .active)
            .cornerRadius(.extraLarge)
        }
        .fontSize(.large)
        .fontWeight(.bold)
        .fontDesign("rounded")
        .textColor(.white)
        .background(.rose, darkness: 900)
        .cornerRadius(.extraLarge)
        .animation(.easeOut, condition: .active)
        .margin(.top, 48, condition: .mobileOnly)
      }
      .flexGap(.y, width: 48, condition: .startingAt(.medium))
      .textAlignment(.center)
    }
    .padding(.vertical, 32)
    .padding(.vertical, 96, condition: .startingAt(.medium))
  }

  @ViewBuilder
  private var hogmobile: some View {
    Div {
      Div {
        HogImage(URL(string: "/gfx/hogmobile-light-shadow.png"))
        HogImage(URL(string: "/gfx/hogmobile-light-hog.png")).className("animate-bounce-hog")
        HogImage(URL(string: "/gfx/hogmobile-light-rear-wheels.png")).className("animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-light-car.png")).className("animate-bounce-car")
        HogImage(URL(string: "/gfx/hogmobile-light-front-wheels.png")).className("animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-light-paw.png")).className("animate-bounce-paw")
        HogImage(URL(string: "/gfx/hogmobile-light-headlights.png")).className("animate-bounce-car")
      }
      .hidden(condition: .dark)

      Div {
        HogImage(URL(string: "/gfx/hogmobile-dark-shadow.png"))
        HogImage(URL(string: "/gfx/hogmobile-dark-hog.png")).className("animate-bounce-hog")
        HogImage(URL(string: "/gfx/hogmobile-dark-rear-wheels.png")).className("animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-dark-car.png")).className("animate-bounce-car")
        HogImage(URL(string: "/gfx/hogmobile-dark-front-wheels.png")).className("animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-dark-paw.png")).className("animate-bounce-paw")
        HogImage(URL(string: "/gfx/hogmobile-dark-headlights.png")).className("animate-bounce-car")
      }
      .hidden()
      .display(.block, condition: .dark)
    }
    .position(.relative)
    .frame(width: 200, height: 150)
    .frame(width: 400, height: 300, condition: .startingAt(.medium))
    .className("animate-drive-car")
  }
}
