import Foundation

import Slipstream

struct Home: View {
  var body: some View {

    Page(
      path: "/",
      description: "Sign up for the beta",
      backgroundColor: Color(.sky, darkness: 100),
      darkModeBackgroundColor: Color(.sky, darkness: 950),
      additionalStylesheets: [URL(string: "/css/parallax.css")]
    ) {
      DrivingScene(showsFireworks: false, skyHeight: 50, groundHeight: 12) {
        VStack(alignment: .center, spacing: 24) {
          Text("Please provide an email address and try again.")
            .id("missing_email")
            .fontWeight(.bold)
            .fontDesign("rounded")
            .textColor(.rose, darkness: 500)
            .textColor(.rose, darkness: 400, condition: .dark)
            .hidden()
            .display(.block, condition: .init(state: .target))

          Form(method: .post, url: URL(string: "https://us-east1-hogmobile.cloudfunctions.net/collectEmails")) {
            ResponsiveStack(spacing: 32) {
              TextField("Email", type: .email, name: "email")
                .fontSize(.large)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .border(Color(.rose, darkness: 300), width: 1)
                .outline(style: .none, condition: .focus)
                .ring(Color(.rose, darkness: 400), width: 4, condition: .focus)
                .cornerRadius(.extraLarge)
                .id("email")

              Button(type: .submit) {
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
            }
            .alignItems(.center)
            .margin(.top, 48, condition: .mobileOnly)
          }
        }
      }

      Div {
        Container {
          VStack(alignment: .center, spacing: 64) {
            ResponsiveStack(spacing: 16) {
              let text = VStack(alignment: .center) {
                Text("PostHog widgets")
                  .fontSize(.extraExtraExtraLarge)
                  .fontSize(.fourXLarge, condition: .desktop)
                  .fontWeight(.heavy)
                Text("Wherever you want them.")
                Text("However you want them.")
              }
                .fontWeight(.bold)
                .fontDesign("rounded")
                .textColor(.zinc, darkness: 950)
                .textColor(.zinc, darkness: 100, condition: .dark)
                .fontSize(.extraLarge)
                .fontSize(.extraExtraLarge, condition: .desktop)

              text
                .hidden(condition: .desktop)

              Picture {
                Source(URL(string: "/gfx/screenshots/dashboards.dark.png"), colorScheme: .dark)
                Source(URL(string: "/gfx/screenshots/dashboards.light.png"), colorScheme: .light)
                Image(URL(string: "/gfx/screenshots/dashboards.light.png"))
                  .frame(width: 393)
              }
              VStack(alignment: .center, spacing: 32) {
                text
                  .hidden(condition: .mobileOnly)

                Picture {
                  Source(URL(string: "/gfx/widgets/widget.world.dark.png"), colorScheme: .dark)
                  Source(URL(string: "/gfx/widgets/widget.world.light.png"), colorScheme: .light)
                  Image(URL(string: "/gfx/widgets/widget.world.light.png"))
                    .frame(width: 300)
                    .frame(width: 350, condition: .desktop)
                }

                Image(URL(string: "/gfx/screenshots/widgets.customization.png"))
                  .frame(width: 300)
                  .frame(width: 393, condition: .desktop)
              }
            }
            .alignItems(.center)
            .flexGap(.x, width: 32, condition: .desktop)

            ResponsiveStack(spacing: 32) {
              let filterImage = Picture {
                Source(URL(string: "/gfx/screenshots/feed.filter.dark.png"), colorScheme: .dark)
                Source(URL(string: "/gfx/screenshots/feed.filter.light.png"), colorScheme: .light)
                Image(URL(string: "/gfx/screenshots/feed.filter.light.png"))
                  .frame(width: 350)
              }

              VStack(alignment: .center, spacing: 32) {
                VStack(alignment: .center) {
                  Text("Unified feed")
                    .fontSize(.extraExtraExtraLarge)
                    .fontSize(.fourXLarge, condition: .desktop)
                    .fontWeight(.heavy)
                  Text("Sip the firehose")
                  Text("...or tune filters to your focus")
                }
                .fontWeight(.bold)
                .fontDesign("rounded")
                .textColor(.zinc, darkness: 950)
                .textColor(.zinc, darkness: 100, condition: .dark)
                .fontSize(.extraLarge)
                .fontSize(.extraExtraLarge, condition: .desktop)

                filterImage
                  .hidden(condition: .mobileOnly)
              }
              Picture {
                Source(URL(string: "/gfx/screenshots/feed.dark.png"), colorScheme: .dark)
                Source(URL(string: "/gfx/screenshots/feed.light.png"), colorScheme: .light)
                Image(URL(string: "/gfx/screenshots/feed.light.png"))
                  .frame(width: 393)
              }
              filterImage
                .hidden(condition: .desktop)
            }
            .alignItems(.center)
          }
          .padding(.bottom, 32)
        }
      }
      .background(.slate, darkness: 400)
      .background(.slate, darkness: 700, condition: .dark)
    }
  }
}
