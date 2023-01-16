import SwiftUI
import SlideUI

struct SafeIndex: View, Slide {
    // @offset(SafeIndex)
    static var offset = CGVector(dx: 1, dy: 2)

    // @hint(SafeIndex){
    static var hint: String? =
"""

"""
    // }@hint(SafeIndex)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Bezpečné používání `String.Index`").font(.presentationHeadline)
                Text(" ").font(.presentationSubHeadline)
            }
            Text(
"""
Mějme řetězec `myString: String`
- Začátek: `myString.startIndex`  konec: `myString.endIndex`
- Platí, že `startIndex < endIndex`
  - `myString[myString.startIndex]` crashne `myString = ""`
  - `myString[myString.endIndex]` crashne vždy

- Pohyb
  - `func index(before i: String.Index) -> String.Index`
  - `func index(after i: String.Index) -> String.Index`
  - `func index(_ i: String.Index, offsetBy distance: Int) -> String.Index`

- Bezpečnější verze:
  - `func index(_ i: String.Index, offsetBy distance: Int, limitedBy limit: String.Index) -> String.Index?`

Složitost *O(n)*, kde *n* je množství "znaků" o které se chci posunout
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct SafeIndex_Previews: PreviewProvider {
    static var previews: some View {
        SafeIndex()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
