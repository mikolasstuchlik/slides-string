import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RangeWithRegex: View, Slide {
    // @offset(RangeWithRegex)
    static var offset = CGVector(dx: 4, dy: 0)

    // @hint(RangeWithRegex){
    static var hint: String? =
"""

"""
    // }@hint(RangeWithRegex)

    init() {}

    private static let defaultCode =
#"""
let string = "Moje jméno je Miki 👋. Doufám 🥹, že se vám prezentace líbí 🙂."

print(string.dropFirst(5).prefix(8))
print(string.dropFirst(11))
print(string.prefix(21))

print(string.firstMatch(of: /.{0,5}(?<toCoHledam>.{0,8}).*/)!.toCoHledam)
print(string.firstMatch(of:
#/
    .{0,5}
    (?<toCoHledam>.{0,8})
    .*
/#
)!.toCoHledam)

print(string.firstMatch(of: /.{0,11}(?<toCoHledam>.*)/)!.toCoHledam)
print(string.firstMatch(of:
#/
    .{0,11}
    (?<toCoHledam>.*)
/#
)!.toCoHledam)

print(string.firstMatch(of: /(?<toCoHledam>.{0,21}).*/)!.toCoHledam)
print(string.firstMatch(of:
#/
    (?<toCoHledam>.{0,21})
    .*
/#
)!.toCoHledam)

"""#

    private static let defaultStdIn =  [
        "swiftc ex6.swift -enable-bare-slash-regex && ./ex6",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex6.swift",
        format: .swift,
        content: RangeWithRegex.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: RangeWithRegex.defaultStdIn[0]
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

struct RangeWithRegex_Previews: PreviewProvider {
    static var previews: some View {
        RangeWithRegex()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
