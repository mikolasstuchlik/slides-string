import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct ParseUseCase: View, Slide {
    // @offset(ParseUseCase)
    static var offset = CGVector(dx: 5, dy: 0)

    // @hint(ParseUseCase){
    static var hint: String? =
"""

"""
    // }@hint(ParseUseCase)

    init() {}

    private static let defaultCode =
#"""
let string =
"""
User: 'Mikoláš Stuchlík' Age: 26
User: 'Petr Želka' Age: 16
"""

struct Record {
    let user: String
    let age: UInt
}

func read(input: String, mapFunction: (Substring) -> Record) -> [Record] {
    var currentString = input[string.startIndex...]
    var result = [Record]()
    while !currentString.isEmpty {
        let nextNewLine = currentString.firstIndex(where: \.isNewline) ?? currentString.endIndex
        result.append(mapFunction(currentString[..<nextNewLine]))
        currentString = currentString[nextNewLine...].dropFirst()
    }
    return result
}

func regexAge(of line: Substring) -> Record {
    let regex = #/
        User:\h'(?<user>\h*\w[\w\h]*)'\h
        Age:\h(?<age>\d+)
    /#

    let result = line.wholeMatch(of: regex)!
    return Record(user: String(result.user), age: UInt(result.age)!)
}
print(read(input: string, mapFunction: regexAge(of:)))

func indexAge(of line: Substring) -> Record {
    assert(line.hasPrefix("User: "))
    let l0 = line.trimmingPrefix("User: ")
    assert(l0.first == "'")
    let l1 = l0.trimmingPrefix("'")
    let endNameIndex = l1.firstIndex(of: "'")!

    let userCandidate = l1[..<endNameIndex]
    assert(userCandidate.allSatisfy {$0.isLetter || $0.isNumber || $0.isWhitespace})
    assert(userCandidate.firstIndex { !$0.isWhitespace } != nil)

    assert(l1[endNameIndex...].dropFirst().hasPrefix(" Age: "))
    let l2 = l1[endNameIndex...].dropFirst().trimmingPrefix(" Age: ")

    let numberCandidate = l2
    assert(numberCandidate.allSatisfy(\.isNumber))

    return Record(user: String(userCandidate), age: UInt(numberCandidate)!)
}
print(read(input: string, mapFunction: indexAge(of:)))

"""#

    private static let defaultStdIn =  [
        "swiftc ex8.swift -enable-bare-slash-regex && ./ex8",
    ]

    @StateObject var execCode: TextEditorView.Model = .init(
        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/ex8.swift",
        format: .swift,
        content: ParseUseCase.defaultCode
    )

    @StateObject var terminal: TerminalView.Model = .init(
        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
        stdIn: ParseUseCase.defaultStdIn[0]
    )

    @State var toggle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Use Case - Parování").font(.presentationHeadline)
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

struct ParseUseCase_Previews: PreviewProvider {
    static var previews: some View {
        ParseUseCase()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
