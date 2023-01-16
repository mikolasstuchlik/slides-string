import SwiftUI
import SlideUI

private let backgrounds: [any Background.Type] = [
]

private let slides: [any Slide.Type] = [
    TitleSlide.self,
    AboutSlides.self,
    AboutIndex.self,
    SafeIndex.self,
    AboutString.self,
    AboutCharacter.self,
    AboutEncodings.self,
    AboutScalar.self,
    AboutCharacterSet.self,
    RangeUseCase.self,
    FilterUseCase.self,
    ParseUseCase.self,
    RangeWithRegex.self,
    AboutRegex.self,
    RegexLiteral.self,
    RegexGroups.self,
    RegexSyntax.self,
    RegexCompiler.self,
]

// @focuses(focuses){
private var focuses: [Focus] = [
    .init(kind: .specific([TitleSlide.self])),
    .init(kind: .specific([AboutSlides.self])),

    .init(kind: .specific([AboutEncodings.self])),
    .init(kind: .specific([AboutString.self])),
    .init(kind: .specific([AboutCharacter.self])),
    .init(kind: .specific([AboutScalar.self])),
    .init(kind: .specific([AboutCharacterSet.self])),

    .init(kind: .specific([FilterUseCase.self])),

    .init(kind: .specific([AboutIndex.self])),
    .init(kind: .specific([SafeIndex.self])),

    .init(kind: .specific([RangeUseCase.self])),

    .init(kind: .specific([AboutRegex.self])),
    .init(kind: .specific([RegexLiteral.self])),
    .init(kind: .specific([RegexGroups.self])),
    .init(kind: .specific([RegexSyntax.self])),

    .init(kind: .specific([RangeWithRegex.self])),
    .init(kind: .specific([RegexCompiler.self])),

    .init(kind: .specific([ParseUseCase.self])),
]
// }@focuses(focuses)

private let presentation = PresentationProperties(
    rootPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/"),
    slidesPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/") + "/Slides",
    backgrounds: backgrounds,
    slides: slides,
    focuses: focuses
)

@main
struct LinkSlidesApp: App {
    var body: some Scene {
        WindowGroup("Toolbar") {
            SlideControlPanel().environmentObject(presentation)
        }

        Window("Slides", id: "slides") {
            Presentation(environment: presentation).environmentObject(presentation)
        }
    }
}
