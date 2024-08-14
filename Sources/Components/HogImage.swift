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
