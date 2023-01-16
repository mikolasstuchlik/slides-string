import SwiftUI
import SlideUI

struct RegexLiteral: View, Slide {
    // @offset(RegexLiteral)
    static var offset = CGVector(dx: 1, dy: 3)

    // @hint(RegexLiteral){
    static var hint: String? =
"""
https://github.com/apple/swift-evolution/blob/main/proposals/0354-regex-literals.md
"""
    // }@hint(RegexLiteral)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Regex").font(.presentationHeadline)
                Text("Regex literál").font(.presentationSubHeadline)
            }
            Text(
"""
- Swift nově přidává možnost používat Regex literály
- Musíte zaškrtnout v Xcode "Enable Bare Slash Regex Literals" na YES
- Nebo použít flag `-enable-bare-slash-regex`
- Kompilátor může staticky zkontrolovat, zda-li je regex validní
- Podle některých zdrojů umožňuje lepší optimalizaci
- *Inline*: `/ ... /`
  - čte všechny znaky
  - neumožňuje komentáře
- *Multiline*: `#/ ... /#
  - Ignoruje horizontální a vertikální bílé znaky
  - Umožňuje "end-of-line" komentáře, za znakem # místo //

**Jazyk regex literálů je docela složitý kvůli tomu že jeden znak může mít vícero významů podle polohy a má velké množství modifikátorů.**
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct RegexLiteral_Previews: PreviewProvider {
    static var previews: some View {
        RegexLiteral()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
