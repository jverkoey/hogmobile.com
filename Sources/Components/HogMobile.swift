import Foundation

import Slipstream

struct HogMobile: View {
  var body: some View {
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
