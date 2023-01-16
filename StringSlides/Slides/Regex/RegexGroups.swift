import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RegexGroups: View, Slide {
    // @offset(RegexGroups)
    static var offset = CGVector(dx: 2, dy: 3)

    // @hint(RegexGroups){
    static var hint: String? =
"""
https://github.com/apple/swift-evolution/blob/main/proposals/0363-unicode-for-string-processing.md
"""
    // }@hint(RegexGroups)

    init() {}

    private static let defaultCode =
#"""
let string: String = ""
let regex = #/

/#

if let result = string.wholeMatch(of: regex) {
    print(result)
} else {
    print("chyba")
}
"""#

    private static let defaultStdIn =  [
        "swiftc ex9.swift -enable-bare-slash-regex && ./ex9",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex9.swift",
        format: .swift,
        content: RegexGroups.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: RegexGroups.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Regex").font(.presentationHeadline)
                Text("Skupiny znaků").font(.presentationSubHeadline)
            }
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
                Group {
                    GridRow {
                        Text("Skupina")
                        Text("Popis - Co reprezentuje")
                        Text("Ukázka")
                    }.foregroundColor(.gray)
                    Divider()
                    GridRow {
                        Text(#"[ ] * ( ) + ? { } ^ $ . | / \"#)
                        Text("Speciální znaky")
                        Text("")
                    }
                    Divider()
                    GridRow {
                        Text("*ostatní znaky*")
                        Text("Jeden výskyt sebe sama (multiline ignorue bílé znaky)")
                        Text(#"/a/ akceptuje "a""#)
                    }
                    GridRow {
                        Text("`.`")
                        Text("Jeden výskyt čehokoliv")
                        Text(#"/./ akceptuje "a", "?", "💻", ..."#)
                    }
                    Divider()
                    GridRow {
                        Text(#"`\w` nebo `[:word:]`"#)
                        Text("Znaky vyskytující se ve slově")
                        Text(#"/\w/ akceptuje "a", "_", "9" ale ne "!""#)
                    }
                    GridRow {
                        Text(#"`\d` nebo `[:digit:]`"#)
                        Text("Čísla")
                        Text(#"/\d/ akceptuje "0", "1", ..."#)
                    }
                    GridRow {
                        Text(#"`\b`"#)
                        Text("Znaky oddělující slova")
                        Text(#"/\b/ akceptuje " ", "!", ..."#)
                    }
                }
                Group {
                    GridRow {
                        Text(#"`\s` nebo `[:space:]`"#)
                        Text("Bílé znaky (`\\h`  - horizontální;  `\\v`  - vertikální)")
                        Text(#"/\s/ akceptuje " ""#)
                    }
                    GridRow {
                        Text(#"`^`  a  `$`"#)
                        Text("Začátek a konec řádku")
                        Text(#""#)
                    }
                }
            }.font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
<<<<<<< HEAD
             ToggleView {
                HStack(spacing: 8) {
                     TextEditorView(
                         axis: .vertical,
                         filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex9.swift",
                         format: .constant(.swift),
                         content: $code
                     )
                     TerminalView(
                         axis: .horizontal,
                         workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
                         aspectRatio: 0.25,
                         stdIn: $stdin,
                         state: $state
                     )
=======
             ToggleView(toggledOn: $toggle) {
                 VStack(spacing: 8) {
                     TextEditorView(model: execCode)
                     TerminalView(model: terminal, aspectRatio: 0.25, axis: .horizontal)
>>>>>>> 8a83533 (Update for latest SlideUI implementation)
                 }
             }
        }.padding()
    }
}

struct RegexGroups_Previews: PreviewProvider {
    static var previews: some View {
        RegexGroups()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
