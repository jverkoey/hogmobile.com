import Foundation

import Slipstream

extension View {
  @ViewBuilder
  fileprivate func background(_ color: Color?, condition: Condition? = nil) -> some View {
    if let color {
      self.background(color, condition: condition)
    } else {
      self
    }
  }
}

struct Page<Content: View>: View {
  init(
    path: String,
    title: String? = nil,
    description: String? = nil,
    backgroundColor: Color? = nil,
    darkModeBackgroundColor: Color? = nil,
    additionalStylesheets: [URL?] = [],
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.path = path
    self.title = title
    self.description = description
    self.backgroundColor = backgroundColor
    self.darkModeBackgroundColor = darkModeBackgroundColor
    self.additionalStylesheets = additionalStylesheets
    self.content = content
  }

  private let siteName: String = "Hog Mobile: PostHog analytics on the go!"

  private var resolvedTitle: String {
    if let title {
      return "\(title) — \(siteName)"
    } else {
      return siteName
    }
  }

  var body: some View {
    HTML {
      Head {
        Charset(.utf8)
        Title(resolvedTitle)
        Viewport(width: .deviceWidth, initialScale: 1, viewportFit: .cover)
        if let description {
          Meta(.description, content: description)
        }
        Meta(.generator, content: "Slipstream")
        Meta(.author, content: "Jeff Verkoeyen")
        Meta("og:title", content: resolvedTitle)
        if let description {
          Meta("og:description", content: description)
        }
        Meta("og:image", content: "https://hogmobile.com/gfx/social-banner.png")
        Meta("og:url", content: "https://hogmobile.com/\(path)")
        Meta("og:type", content: "website")
        Meta("og:site_name", content: siteName)
        Stylesheet(URL(string: "/css/main.css"))
        for stylesheet in additionalStylesheets {
          Stylesheet(stylesheet)
        }

        Script("""
!function(t,e){var o,n,p,r;e.__SV||(window.posthog=e,e._i=[],e.init=function(i,s,a){function g(t,e){var o=e.split(".");2==o.length&&(t=t[o[0]],e=o[1]),t[e]=function(){t.push([e].concat(Array.prototype.slice.call(arguments,0)))}}(p=t.createElement("script")).type="text/javascript",p.async=!0,p.src=s.api_host.replace(".i.posthog.com","-assets.i.posthog.com")+"/static/array.js",(r=t.getElementsByTagName("script")[0]).parentNode.insertBefore(p,r);var u=e;for(void 0!==a?u=e[a]=[]:a="posthog",u.people=u.people||[],u.toString=function(t){var e="posthog";return"posthog"!==a&&(e+="."+a),t||(e+=" (stub)"),e},u.people.toString=function(){return u.toString(1)+".people (stub)"},o="capture identify alias people.set people.set_once set_config register register_once unregister opt_out_capturing has_opted_out_capturing opt_in_capturing reset isFeatureEnabled onFeatureFlags getFeatureFlag getFeatureFlagPayload reloadFeatureFlags group updateEarlyAccessFeatureEnrollment getEarlyAccessFeatures getActiveMatchingSurveys getSurveys getNextSurveyStep onSessionId setPersonProperties".split(" "),n=0;n<o.length;n++)g(u,o[n]);e._i.push([i,s,a])},e.__SV=1)}(document,window.posthog||[]);
posthog.init('phc_XukeUB7VPJ1qEPzLpsW6HEjDgfLvzviQTqjODbDZES3',{api_host:'https://eu.i.posthog.com', person_profiles: 'identified_only' // or 'always' to create profiles for anonymous users as well
    })
""")
      }
      Body {
        content()

        Footer {
          Container {
            VStack(alignment: .center, spacing: 16) {
              Link(URL(string: "https://github.com/jverkoey/slipstream")) {
                Image(URL(string: "/gfx/built-with-slipstream.svg"))
                  .accessibilityLabel("Built with Slipstream")
              }
              .modifier(ClassModifier(add: "cursor-pointer"))
              VStack(alignment: .end) {
                Text {
                  DOMString("Copyright © \(Calendar.current.component(.year, from: Date())) ")
                  Link("fearless design, LLC", destination: URL(string: "https://featherless.design"))
                    .textColor(.rose, darkness: 600)
                    .textColor(.rose, darkness: 400, condition: .dark)
                    .fontWeight(600)
                    .underline(condition: .hover)
                }
                Text {
                  Link("PostHog", destination: URL(string: "https://posthog.com"))
                    .textColor(.rose, darkness: 600)
                    .textColor(.rose, darkness: 400, condition: .dark)
                    .fontWeight(600)
                    .underline(condition: .hover)
                  DOMString(" is a trademark of PostHog, Inc.")
                }
              }
              .textColor(.zinc, darkness: 600)
              .textColor(.zinc, darkness: 300, condition: .dark)
            }
            .justifyContent(.between)
          }
          .padding(.vertical, 32)
        }
        .border(.palette(.zinc, darkness: 300), width: 1, edges: .top)
        .border(.palette(.zinc, darkness: 700), width: 1, edges: .top, condition: .dark)
        .background(.zinc, darkness: 200)
        .background(.zinc, darkness: 800, condition: .dark)
      }
      .antialiased()
      .background(backgroundColor)
      .background(darkModeBackgroundColor, condition: .dark)
    }
    .language("en")
    .environment(\.path, path)
  }

  private let path: String
  private let title: String?
  private let description: String?
  private let backgroundColor: Color?
  private let darkModeBackgroundColor: Color?
  private let additionalStylesheets: [URL?]
  @ViewBuilder private let content: () -> Content
}

private struct PathEnvironmentKey: EnvironmentKey {
  static let defaultValue: String = "/"
}

extension EnvironmentValues {
  var path: String {
    get { self[PathEnvironmentKey.self] }
    set { self[PathEnvironmentKey.self] = newValue }
  }
}
