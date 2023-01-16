import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct AboutRegex: View, Slide {
    // @offset(AboutRegex)
    static var offset = CGVector(dx: 0, dy: 3)

    // @hint(AboutRegex){
    static var hint: String? =
"""
https://github.com/apple/swift-evolution/blob/main/proposals/0350-regex-type-overview.md

https://developer.apple.com/videos/play/wwdc2022/110357/
https://developer.apple.com/videos/play/wwdc2022/110358
"""
    // }@hint(AboutRegex)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Regex").font(.presentationHeadline)
                Text("Regex builder").font(.presentationSubHeadline)
            }
            Text(
"""
 - Nebudeme řešit Regex Builder, je dobře zdokumentovaný.
 - `RegexComponent` důležitý protokol - jeho extension říkají, co může v  `RegexBuilderu být`
 - Přidává nové kategorie znaků `CharacterClass`,  která používá  `Unicode.GeneralCategory`
 - **Musíte importovat `RegexBuilder`!**

 - `Unicode.GeneralCategory`
   - od iOS 8
   - je  `enum`
   - obsahuje 29 kategorií znaků, např.  `modifierSymbol`,  `mathSymbol`
   - neumožňuje množinové operace

 - `CharacterClass`
   - Novinka v iOS 16
   - Může být definována pomocí  `CharacterClass`
   - Pro  `RegexComponent`  definuje dalších 10 kategorií znaků (např. `.word`)
   - Pro  `RegexComponent`  umožňuje i definici výčtem znaků

 - Na extension  `RegexComponent` jsou dále třeba formattery typu  `.date`,  `.currency`,  `.url`, ...

"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct AboutRegex_Previews: PreviewProvider {
    static var previews: some View {
        AboutRegex()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
