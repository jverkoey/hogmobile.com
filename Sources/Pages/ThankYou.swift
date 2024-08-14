import Foundation

import Slipstream

struct ThankYou: View {
  var body: some View {
    Scene(
      path: "/",
      description: "PostHog analytics natively on iOS",
      showsFireworks: true
    ) {
      VStack(alignment: .center) {
        Paragraph("Thank you!")
          .fontSize(.large)
          .fontSize(.extraExtraLarge, condition: .startingAt(.medium))
          .fontWeight(.black)
          .fontDesign("rounded")
          .textColor(.rose, darkness: 500)
          .textColor(.rose, darkness: 400, condition: .dark)
        Paragraph("You'll get an email when Hog Mobile is ready to test.")
          .padding(.horizontal, 64, condition: .mobileOnly)
          .fontSize(.large)
          .fontWeight(.bold)
          .fontDesign("rounded")
          .textColor(.rose, darkness: 500)
          .textColor(.rose, darkness: 400, condition: .dark)
      }
    }
  }
}
