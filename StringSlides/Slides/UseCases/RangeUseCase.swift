import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RangeUseCase: View, Slide {
    // @offset(RangeUseCase)
    static var offset = CGVector(dx: 3, dy: 0)

    // @hint(RangeUseCase){
    static var hint: String? =
"""

"""
    // }@hint(RangeUseCase)

    init() {}

    private static let defaultCode =
#"""
extension String {
    subscript(_ graphemeIndex: Int) -> Character! {
        index(startIndex, offsetBy: graphemeIndex, limitedBy: endIndex).flatMap { self[$0] }
    }

    subscript(_ range: ClosedRange<Int>) -> Substring {
        let rangeStartIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? startIndex
        let rangeEndIndex = index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex) ?? endIndex
        return self[rangeStartIndex...rangeEndIndex]
    }

    subscript(_ range: PartialRangeFrom<Int>) -> Substring {
        self[(index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? startIndex)...]
    }

    subscript(_ range: PartialRangeThrough<Int>) -> Substring {
        self[...(index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex) ?? endIndex)]
    }
}
let string = "Moje jméno je Miki 👋. Doufám 🥹, že se vám prezentace líbí 🙂."

print(string[5...12])
print(string[11...])
print(string[...20])
print()

print(string.dropFirst(5).prefix(8))
print(string.dropFirst(11))
print(string.prefix(21))

"""#

    private static let defaultStdIn =  [
        "swiftc ex5.swift && ./ex5",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex5.swift",
        format: .swift,
        content: RangeUseCase.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: RangeUseCase.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Use Case - Zkracování").font(.presentationHeadline)
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

struct RangeUseCase_Previews: PreviewProvider {
    static var previews: some View {
        RangeUseCase()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
