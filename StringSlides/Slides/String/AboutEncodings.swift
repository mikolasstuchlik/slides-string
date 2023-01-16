import SwiftUI
import SlideUI

struct AboutEncodings: View, Slide {
    // @offset(AboutEncodings)
    static var offset = CGVector(dx: 0, dy: 1)
    
    // @hint(AboutEncodings){
    static var hint: String? =
"""
https://stackoverflow.com/questions/27331819/whats-the-difference-between-a-character-a-code-point-a-glyph-and-a-grapheme
"""
    // }@hint(AboutEncodings)
    
    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Kódování znaků").font(.presentationHeadline)
                Text("Co je ASCII, Unicode, UTF").font(.presentationSubHeadline)
            }
            Text(
"""
ASCII
 - znak má 8 bitů
 - definován tabulkou - každé číslo má přiřazený znak
 - více tabulek podle regionu, prvních 128 znaků všude stejné

Unicode
 - standard pro znakovou sadu, kódování znaků a **algoritmy pro zpracování**
 - cca 140 000 znaků
 - definuje kódování UTF-8, UTF-16 ad.
 - *Code Point* nebo *Skalár* - základní jednotka informace v Unicode
 - *Grafém* nebo *Grapheme cluster* - jeden nebo více *code point*ů, které reprezenují jeden "znak"

"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            HStack {
                Text(
"""
UTF-8
 - kódování Unicode do 8 bitových "čísel"
 - ASCII kompatibilní
"""
                ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
                Text(
"""
UTF-16
 - kódování Unicode do 16 bitových "čísel"
"""
                ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
            }
        }.padding()
    }
}

struct AboutEncodings_Previews: PreviewProvider {
    static var previews: some View {
        AboutEncodings().frame(width: 1024, height: 768)
    }
}
