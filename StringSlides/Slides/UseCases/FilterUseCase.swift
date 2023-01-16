import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct FilterUseCase: View, Slide {
    // @offset(FilterUseCase)
    static var offset = CGVector(dx: 2, dy: 0)

    // @hint(FilterUseCase){
    static var hint: String? =
"""

"""
    // }@hint(FilterUseCase)

    init() {}

    private static let defaultCode =
#"""
import Foundation

let string =
"""
Cesta ke štěstí je lemována tajemstvím.
\tOvšem 👧🏻🧒🏼, kteří pracují s 👩‍💻 tvrdí, že cesta ke štěstí zní `file:///usr/bin/swift`!
"""

// Použití Character
print(string.filter { (char: Character) in char.isLetter || char.isWhitespace || char.isPunctuation})

// Použití Character Set

let allowed = CharacterSet.letters.union(.whitespacesAndNewlines).union(.punctuationCharacters) // Ale ne .whitespaces

//                                              [Unicode.Scalar]
print(string.filter { (char: Character) in char.unicodeScalars.allSatisfy(allowed.contains(_:))} )

"""#

    private static let defaultStdIn =  [
        "swiftc ex7.swift && ./ex7",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex7.swift",
        format: .swift,
        content: FilterUseCase.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: FilterUseCase.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Use Case - Filtrování").font(.presentationHeadline)
                Text("").font(.presentationSubHeadline)
            }
            ToggleView(toggledOn: $toggle) {
                VStack(spacing: 8) {
                    TextEditorView(model: execCode)
                    TerminalView(model: terminal, aspectRatio: 0.25, axis: .horizontal)
                }
            }
        }.padding()
    }
}

struct FilterUseCase_Previews: PreviewProvider {
    static var previews: some View {
        FilterUseCase()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
