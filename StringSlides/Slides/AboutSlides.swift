import SwiftUI
import SlideUI

struct AboutSlides: View, Slide {
    // @offset(AboutSlides)
    static var offset = CGVector(dx: 1, dy: 0)
    
    // @hint(AboutSlides){
    static var hint: String? =
"""

"""
    // }@hint(AboutSlides)
    
    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Osnova").font(.presentationHeadline)
                Text(" ").font(.presentationSubHeadline)
            }
            Text(
"""
Cíle:

 - Povrchní znalost typů `String`,  `Character`,  `Unicode.Scalar`,  `String.Index`,  `CharacterSet`,  `Unicode.GeneralCategory`,  `CharacterClass`
 - Jak pracovat bezpečně s řetězci a jejich indexy
 - Vytvořit a použít jednoduchý regulární výraz ve Swiftu
 - Kde jsou materiály pro složitější regulární výrazy
 - K čemu použít Regulární výrazy v Xcode

 - Ukážeme si několik use-casů: **filtrování znaků**, **výběry rozsahů**, **parsování**
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct AboutSlides_Previews: PreviewProvider {
    static var previews: some View {
        AboutSlides().frame(width: 1024, height: 768)
    }
}
