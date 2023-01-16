import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct AboutCharacterSet: View, Slide {
    // @offset(AboutCharacterSet)
    static var offset = CGVector(dx: 4, dy: 1)

    // @hint(AboutCharacterSet){
    static var hint: String? =
"""
Emoji je seskládáno ze skaláru
https://www.compart.com/en/unicode/U+1F3FB#UNC_DB
"""
    // }@hint(AboutCharacterSet)

    init() {}

    private static let defaultCode =
#"""
import Foundation
let aSet = CharacterSet(charactersIn: "🧒🏻👧")

print("👧🏻".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
print("🧒".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
print("👦🏿".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
"""#

    private static let defaultStdIn =  [
        "swiftc ex4.swift && ./ex4",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex4.swift",
        format: .swift,
        content: AboutCharacterSet.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: AboutCharacterSet.defaultStdIn[0]
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
 - `CharacterSet` je `Foundation` typ
 - Obsahuje 20 kategorií, mnohem více než `Character` (např. `urlPathAllowed`)
 - Umožňuje množivné oprace: průnik, doplněk, ...
 - **Pracuje ale se skaláry, nikoliv grafémy!**
 - Podporuje zadání pomocí explicitního výčtu znaků
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

struct AboutCharacterSet_Previews: PreviewProvider {
    static var previews: some View {
        AboutCharacterSet()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
