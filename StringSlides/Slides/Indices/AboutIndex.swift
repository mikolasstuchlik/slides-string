import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct AboutIndex: View, Slide {
    // @offset(AboutIndex)
    static var offset = CGVector(dx: 0, dy: 2)

    // @hint(AboutIndex){
    static var hint: String? =
"""
https://github.com/apple/swift/blob/main/stdlib/public/core/StringIndex.swift
"""
    // }@hint(AboutIndex)

    init() {}

    private static let defaultCode =
#"""
let str = "Štětináč!"

var current = str.startIndex
while current < str.endIndex {
    print(str[current], current)
    current = str.index(after: current)
}

"""#

    private static let defaultStdIn =  [
        "swiftc ex3.swift && ./ex3",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex3.swift",
        format: .swift,
        content: AboutIndex.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: AboutIndex.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Indexování typu `String`").font(.presentationHeadline)
                Text("Typ `String.Index`").font(.presentationSubHeadline)
            }
            HStack {
                VStack {
                    Text(
"""
- U `Array<T>` jsme zvyklí, že `Index = Int`
- V případě `String.Index` tomu tak není.
- `String.Index` je uložen jako číslo, ale kóduje více informací
- `String.Index` můžu použít jako subscript nebo v Range
- např. `retezec[retezec.startIndex..<retezec.endIndex]` vrátí celý řetězec
"""
                    ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
                    Image("layout").resizable().aspectRatio(contentMode: .fit)
                }
                ToggleView(toggledOn: $toggle) {
                    VStack(spacing: 8) {
                        TextEditorView(model: execCode)
                        TerminalView(model: terminal, aspectRatio: 0.25, axis: .horizontal)
                    }
                }
            }
        }.padding()
    }
}

struct AboutIndex_Previews: PreviewProvider {
    static var previews: some View {
        AboutIndex()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
