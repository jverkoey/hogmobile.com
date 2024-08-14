import Foundation

import Slipstream

struct Home: View {
  var body: some View {
    Scene(
      path: "/",
      description: "PostHog analytics natively on iOS"
    ) {
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
  }
}
