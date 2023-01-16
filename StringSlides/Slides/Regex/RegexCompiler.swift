import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RegexCompiler: View, Slide {
    // @offset(RegexCompiler)
    static var offset = CGVector(dx: 4, dy: 3)

    // @hint(RegexCompiler){
    static var hint: String? =
"""

"""
    // }@hint(RegexCompiler)

    init() {}

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Regex").font(.presentationHeadline)
                Text("Online kompilátor").font(.presentationSubHeadline)
            }
            ToggleView(toggledOn: $toggle) {
                WebView(url: URL(string: "https://regex101.com")!)
            }
        }.padding()
    }
}

struct RegexCompiler_Previews: PreviewProvider {
    static var previews: some View {
        RegexCompiler()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
