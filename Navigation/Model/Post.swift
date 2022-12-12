//
//  Post.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import Foundation



struct Post {
    let title: String
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

var posts: [Post] = [

   Post(title: "Cappuccino", author: "evgenii.mikhailov", description: "A cappuccino is an espresso-based coffee drink that originated in Austria and was later popularized in Italy and is prepared with steamed milk foam (microfoam). Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder. It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam", image: "cappuccino", likes: 100, views: 100),
    
  Post(title: "Mocha", author: "evgenii.mikhailov", description: "A caffè mocha (/ˈmɒkə/ or /ˈmoʊkə/), also called mocaccino (Italian: [mokatˈtʃiːno]), is a chocolate-flavoured warm beverage that is a variant of a caffè latte (Italian: [kafˈfɛ lˈlatte]), commonly served in a glass rather than a mug. Other commonly used spellings are mochaccino and also mochachino. The name is derived from the city of Mocha, Yemen, which was one of the centres of early coffee trade. Like latte, the name is commonly shortened to just mocha", image: "mocha", likes: 100, views: 100),
    
Post(title: "Latte", author: "evgenii.mikhailov", description: "Caffè latte (Italian: [kafˌfɛ lˈlatte]), often shortened to just latte (/ˈlɑːteɪ, ˈlæteɪ/) in English, is a coffee beverage of Italian origin made with espresso and steamed milk. Variants include the chocolate-flavored mocha or replacing the coffee with another beverage base such as masala chai (spiced Indian tea), mate, matcha, turmeric or rooibos; alternatives to milk, such as soy milk or almond milk, are also used.", image: "latte", likes: 100, views: 100),

    Post(title: "Americano", author: "evgenii.mikhailov", description: "Caffè Americano is a type of coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from, traditionally brewed coffee. Its strength varies with the number of shots of espresso and amount of water added. The name is also spelled with varying capitalization and use of diacritics: e.g., café americano.", image: "americano", likes: 100, views: 100)
]







