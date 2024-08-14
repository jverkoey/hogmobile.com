import Foundation

import Slipstream

struct HogMobile: View {
  var body: some View {
    Div {
      Div {
        HogImage(URL(string: "/gfx/hogmobile-light-shadow.png"))
        HogImage(URL(string: "/gfx/hogmobile-light-hog.png"))         .className("motion-safe:animate-bounce-hog")
        HogImage(URL(string: "/gfx/hogmobile-light-rear-wheels.png")) .className("motion-safe:animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-light-car.png"))         .className("motion-safe:animate-bounce-car")
        HogImage(URL(string: "/gfx/hogmobile-light-front-wheels.png")).className("motion-safe:animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-light-paw.png"))         .className("motion-safe:animate-bounce-paw")
        HogImage(URL(string: "/gfx/hogmobile-light-headlights.png"))  .className("motion-safe:animate-bounce-car")
          .className("active:opacity-0")
          .animation(.easeInOut)
      }
      .hidden(condition: .dark)

      Div {
        HogImage(URL(string: "/gfx/hogmobile-dark-shadow.png"))
        HogImage(URL(string: "/gfx/hogmobile-dark-hog.png"))          .className("motion-safe:animate-bounce-hog")
        HogImage(URL(string: "/gfx/hogmobile-dark-rear-wheels.png"))  .className("motion-safe:animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-dark-car.png"))          .className("motion-safe:animate-bounce-car")
        HogImage(URL(string: "/gfx/hogmobile-dark-front-wheels.png")) .className("motion-safe:animate-bounce-wheels")
        HogImage(URL(string: "/gfx/hogmobile-dark-paw.png"))          .className("motion-safe:animate-bounce-paw")
        HogImage(URL(string: "/gfx/hogmobile-dark-headlights.png"))   .className("motion-safe:animate-bounce-car")
          .className("active:opacity-0")
          .animation(.easeInOut)
      }
      .hidden()
      .display(.block, condition: .dark)
    }
    .position(.relative)
    .frame(width: 200, height: 150)
    .frame(width: 400, height: 300, condition: .startingAt(.medium))
    .className("motion-safe:animate-drive-car")
  }
}
