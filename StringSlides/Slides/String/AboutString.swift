import SwiftUI
import SlideUI

struct AboutString: View, Slide {
    // @offset(AboutString)
    static var offset = CGVector(dx: 1, dy: 1)
    
    // @hint(AboutString){
    static var hint: String? =
"""
Více o Stringu https://www.swift.org/blog/utf8-string/
"""
    // }@hint(AboutString)
    
    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Řetězec - datový typ `String`").font(.presentationHeadline)
                Text("20 A4 textu na jednom snímku").font(.presentationSubHeadline)
            }
            Image("string5").frame(maxWidth: .infinity, alignment: .center)
            Text(
"""
 - *Copy-on-write* `struct` s netriviální implmentací
 - Jedná se o `BidirectionalCollection`
 - `Element = Character`
 - **Není** `RandomAccessCollection`  nelze číst náhodné pozice v řetězci, je možný přístup ze začátku nebo z konce
 - Proč? Data jsou uvnitř uložena v UTF-8
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct AboutString_Previews: PreviewProvider {
    static var previews: some View {
        AboutString().frame(width: 1024, height: 768)
    }
}
