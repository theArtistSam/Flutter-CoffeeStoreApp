class ProductModel{
  String productImage;
  String productName;
  String productTagLine;
  String productDescription;
  double productPrice;
  double productRating;

  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productTagLine,
    required this.productDescription,
    required this.productPrice,
    required this.productRating,
  });
}

// Default Product Items
List<ProductModel> allProducts = [
  ProductModel(
    productImage: "coffee-1.png",
    productName: "Cappuccino",
    productTagLine: "with Chocolate",
    productDescription: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the for the perfect taste",
    productPrice: 4.53,
    productRating: 4.8,
  ),
  ProductModel(
    productImage: "coffee-2.png",
    productName: "Espresso",
    productTagLine: "Strong and Flavorful",
    productDescription: "Espresso is a coffee-brewing method of Italian origin, in which a small amount of nearly boiling water is forced under pressure through finely-ground coffee beans.",
    productPrice: 3.99,
    productRating: 4.5,
  ),
  ProductModel(
    productImage: "coffee-3.png",
    productName: "Latte",
    productTagLine: "Smooth and Creamy",
    productDescription: "A latte is a coffee drink made with espresso and steamed milk. The term as used in English is a shortened form of the Italian caffè latte.",
    productPrice: 4.99,
    productRating: 4.6,
  ),
  ProductModel(
    productImage: "coffee-4.png",
    productName: "Mocha",
    productTagLine: "Rich and Chocolatey",
    productDescription: "A mocha is a variant of a caffe latte, but with added chocolate flavoring and sweeteners, typically in the form of cocoa powder and sugar.",
    productPrice: 5.49,
    productRating: 4.7,
  ),
  ProductModel(
    productImage: "coffee-3.png",
    productName: "Macchiato",
    productTagLine: "Bold and Intense",
    productDescription: "A macchiato, sometimes called espresso macchiato, is an espresso coffee drink with a small amount of milk, usually foamed.",
    productPrice: 4.29,
    productRating: 4.4,
  ),
  ProductModel(
    productImage: "coffee-2.png",
    productName: "Affogato",
    productTagLine: "Elegant and Decadent",
    productDescription: "Affogato is a coffee-based dessert. It usually takes the form of a scoop of vanilla gelato or ice cream topped or \"drowned\" with a shot of hot espresso.",
    productPrice: 6.99,
    productRating: 4.9,
  ),
  ProductModel(
    productImage: "coffee-1.png",
    productName: "Americano",
    productTagLine: "Simple and Refreshing",
    productDescription: "An Americano is a type of coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from, traditionally brewed coffee.",
    productPrice: 3.79,
    productRating: 4.3,
  ),
  ProductModel(
    productImage: "coffee-3.png",
    productName: "Flat White",
    productTagLine: "Smooth and Velvety",
    productDescription: "A flat white is a coffee drink consisting of espresso with microfoam (steamed milk with small, fine bubbles with a glossy or velvety consistency).",
    productPrice: 5.79,
    productRating: 4.7,
  ),
  ProductModel(
    productImage: "coffee-4.png",
    productName: "Irish Coffee",
    productTagLine: "Warm and Spirited",
    productDescription: "Irish coffee is a cocktail consisting of hot coffee, Irish whiskey, and sugar, stirred, and topped with cream. The coffee is drunk through the cream.",
    productPrice: 7.49,
    productRating: 4.8,
  ),
  ProductModel(
    productImage: "coffee-2.png",
    productName: "Vienna Coffee",
    productTagLine: "Elegant and Indulgent",
    productDescription: "Viennese coffee or Vienna coffee is the name given to a popular way of preparing coffee by adding whipped cream to it. It's often served with a dusting of cocoa powder on top.",
    productPrice: 6.29,
    productRating: 4.6,
  ),
];

