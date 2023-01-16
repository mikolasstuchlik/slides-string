import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct AboutCharacter: View, Slide {
    // @offset(AboutCharacter)
    static var offset = CGVector(dx: 2, dy: 1)
    
    // @hint(AboutCharacter){
    static var hint: String? =
"""

"""
    // }@hint(AboutCharacter)
    
    init() {}

    private static let defaultCode =
#"""
let string = "Ahoj Julku, jak se vede?"

print(string)
print(string.filter(\.isLetter))
"""#

    private static let defaultStdIn =  [
        "swiftc ex1.swift && ./ex1",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex1.swift",
        format: .swift,
        content: AboutCharacter.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: AboutCharacter.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Typ `Character` - element typu `String`").font(.presentationHeadline)
                Text(" ").font(.presentationSubHeadline)
            }
            Text(
"""
 - `Character` reprezentuje *grafém*
 - 14 kategorií: `isLetter`,  `isWhitespace`, ...
 - Relativně omezené možnosti, není např. "is emoji"
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

struct AboutCharacter_Previews: PreviewProvider {
    static var previews: some View {
        AboutCharacter()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
