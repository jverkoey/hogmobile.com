import Foundation

import Slipstream

struct Hero: View {
  var body: some View {
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
  }
}
