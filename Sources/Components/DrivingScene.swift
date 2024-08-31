import Slipstream

struct DrivingScene<Content: View>: View {
  let showsFireworks: Bool

  /// Sky height, in lhv units.
  let skyHeight: Int

  /// Ground height, in lhv units.
  let groundHeight: Int

  @ViewBuilder let content: () -> Content

  var body: some View {
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
          Hero()
          content()
        }
        .flexGap(.y, width: 48, condition: .startingAt(.medium))
        .textAlignment(.center)
      }
      .padding(.vertical, 32)
      .frame(minHeight: 500)
      .className("h-[\(skyHeight)lvh]")
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
          .offset(x: -0.5, y: -0.6)
        }
        .frame(width: .full, height: .full)
        .background(.slate, darkness: 400)
        .background(.slate, darkness: 700, condition: .dark)
      }
      .className("overflow-x-clip")
      .frame(width: .full)
      .className("h-[\(groundHeight)lvh]")
      .position(.relative)
    }
  }
}
