import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct AboutScalar: View, Slide {
    // @offset(AboutScalar)
    static var offset = CGVector(dx: 3, dy: 1)

    // @hint(AboutScalar){
    static var hint: String? =
"""

"""
    // }@hint(AboutScalar)

    init() {}
    private static let defaultCode =
#"""
let string = "Ráďa 🧑‍💻"

print(string.map { $0.self })
print(string.map(\.utf8.count))
print(string.map(\.unicodeScalars.count))
"""#

    private static let defaultStdIn =  [
        "swiftc ex2.swift && ./ex2",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex2.swift",
        format: .swift,
        content: AboutScalar.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: AboutScalar.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Typ `Unicode.Scalar`").font(.presentationHeadline)
                Text(" ").font(.presentationSubHeadline)
            }
            Text(
"""
 - `Unicode.Scalar` reprezentuje *Code point* resp. *skalár*
 - Má konstruktor pro `Int`
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
            ToggleView(toggledOn: $toggle) {
                VStack(spacing: 8) {
                    TextEditorView(model: execCode)
                    TerminalView(model: terminal, aspectRatio: 0.25, axis: .horizontal)
                }
            }
        }.padding()
    }
}

struct AboutScalar_Previews: PreviewProvider {
    static var previews: some View {
        AboutScalar()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
