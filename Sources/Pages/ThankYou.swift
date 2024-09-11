import Foundation

import Slipstream

struct ThankYou: View {
  var body: some View {

    Page(
      path: "/thank-you/",
      description: "Thank you for signing up for the Hog Mobile beta!",
      backgroundColor: Color(.sky, darkness: 100),
      darkModeBackgroundColor: Color(.sky, darkness: 950),
      additionalStylesheets: [
        URL(string: "/css/parallax.css"),
        URL(string: "/css/fireworks.css"),
      ]
    ) {
      DrivingScene(showsFireworks: true, skyHeight: 80, groundHeight: 20) {
        VStack(alignment: .center, spacing: 32) {
          VStack(alignment: .center, spacing: 32) {
            Paragraph("Thank you!")
              .fontSize(.large)
              .fontSize(.extraExtraLarge, condition: .startingAt(.medium))
              .fontWeight(.black)
              .fontDesign("rounded")
              .textColor(.rose, darkness: 500)
              .textColor(.rose, darkness: 400, condition: .dark)
            Link(URL(string: "https://testflight.apple.com/join/4HJFx8AA")) {
              Button {
                Span("Open TestFlight")
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
            }
              .padding(.horizontal, 64, condition: .mobileOnly)
              .fontSize(.large)
              .fontWeight(.bold)
              .fontDesign("rounded")
              .textColor(.rose, darkness: 500)
              .textColor(.rose, darkness: 400, condition: .dark)
          }

          Link(URL(string: "https://www.threads.net/intent/post?text=I just signed up for Hog Mobile beta! It's a new third party PostHog mobile client — check it out https://hogmobile.com/")) {
            Span("Share the love on Threads")
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
        }
      }
    }
  }
}
