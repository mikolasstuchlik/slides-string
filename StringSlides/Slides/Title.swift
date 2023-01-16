import SwiftUI
import SlideUI

struct TitleSlide: View, Slide {
    // @offset(Title)
    static var offset = CGVector(dx: 0, dy: 0)
    
    // @hint(Title){
    static var hint: String? =
"""

"""
    // }@hint(Title)
    
    init() {}

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Řetězce a regulární výrazy")
                    .font(.presentationTitle)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Text("Mikoláš Stuchlík, Futured.app, 2023")
                .font(.presentationNote)
        }
        .padding()
    }
}

struct TitleSlide_Previews: PreviewProvider {
    static var previews: some View {
        TitleSlide().frame(width: 1024, height: 768)
    }
}
