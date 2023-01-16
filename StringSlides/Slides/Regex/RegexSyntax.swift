import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RegexSyntax: View, Slide {
    // @offset(RegexSyntax)
    static var offset = CGVector(dx: 3, dy: 3)

    // @hint(RegexSyntax){
    static var hint: String? =
"""
https://github.com/apple/swift-evolution/blob/main/proposals/0355-regex-syntax-run-time-construction.md
"""
    // }@hint(RegexSyntax)

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
        "swiftc ex10.swift -enable-bare-slash-regex && ./ex10",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex10.swift",
        format: .swift,
        content: RegexSyntax.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: RegexSyntax.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Regex").font(.presentationHeadline)
                Text("Syntaxe").font(.presentationSubHeadline)
            }
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
                Group {
                    GridRow {
                        Text("Sekvence")
                        Text("Popis - co dělá")
                        Text("Ukázka")
                    }.foregroundColor(.gray)
                    Divider()
                    GridRow {
                        Text(#"*"#)
                        Text("Předchozí element se opakuje 0 - nekonečno krát")
                        Text(#"/a*/ akceptuje "", "a", "aa", ..."#)
                    }
                    GridRow {
                        Text("*+*")
                        Text("Předchozí element se opakuje 1 - nekonečno krát")
                        Text(#"/a+/ akceptuje "a", "aa", ...  "#)
                    }
                    GridRow {
                        Text("`{n,m}`")
                        Text("Předchozí element se opakuje n - m krát (čárka povinna, n ani m ne)")
                        Text(#"/.{2,}/ akceptuje "ab", "abc", ... "#)
                    }
                    GridRow {
                        Text("`{n}`")
                        Text("Předchozí element se opakuje n krát")
                        Text(#"/.{3}/ akceptuje "abc", ..."#)
                    }
                    GridRow {
                        Text("`?`")
                        Text("Předchozí element může obsahovat jednou nebo 0krát")
                        Text(#"/aa?/ akceptuje "a", "aa" "#)
                    }
                    Divider()
                }
                Group {
                    GridRow {
                        Text(#"`[ ... ]`"#)
                        Text("Reprezentuje jeden výskyt znaku (nebo skupiny)")
                        Text(#"/[abc]/ akceptuje "a", "b" nebo "c" "#)
                    }
                    GridRow {
                        Text(#"`a|b`"#)
                        Text("Reprezentuje jeden výskyt znaku a nebo b")
                        Text(#"/a|b/ akceptuje "a", "b" "#)
                    }
                    Divider()
                    GridRow {
                        Text(#"`(?: ... )`"#)
                        Text("Uzavírá skupinu, kterou musí výraz obsahovat")
                        Text(#" Užitečné v kombinaci s | a multiplikátory "#)
                    }
                    GridRow {
                        Text(#"`( ... )`"#)
                        Text("Zachycuje skupinu pod jejím pořadovým číslem")
                        Text(#" Po vyhodnocení použijeme např. `result.1` "#)
                    }
                    GridRow {
                        Text(#"`(?<name> ... )`"#)
                        Text("Zachycuje skupinu pod jejím jménem")
                        Text(#" Po vyhodnocení použijeme např. `result.name` "#)
                    }
                }
            }.font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
<<<<<<< HEAD
             ToggleView {
                 HStack(spacing: 8) {
                     TextEditorView(
                         axis: .vertical,
                         filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex10.swift",
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

struct RegexSyntax_Previews: PreviewProvider {
    static var previews: some View {
        RegexSyntax()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
