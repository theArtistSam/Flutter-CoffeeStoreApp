class ProductModel{
  String productImage;
  String productName;
  String productDescription;
  double productPrice;
  double productRating;

  ProductModel({
    required this.productImage,
    required this.productName,
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
    productDescription: "with Chocolate",
    productPrice: 4.53,
    productRating: 4.8,
  ),
  ProductModel(
    productImage: "coffee-2.png",
    productName: "Espresso",
    productDescription: "Strong coffee",
    productPrice: 3.99,
    productRating: 4.5,
  ),
  ProductModel(
    productImage: "coffee-3.png",
    productName: "Latte",
    productDescription: "Creamy coffee",
    productPrice: 4.99,
    productRating: 4.7,
  ),
  ProductModel(
    productImage: "coffee-4.png",
    productName: "Mocha",
    productDescription: "with Chocolate and cream",
    productPrice: 5.25,
    productRating: 4.6,
  ),
  ProductModel(
    productImage: "coffee-1.png",
    productName: "Macchiato",
    productDescription: "Espresso with a dash of milk",
    productPrice: 4.75,
    productRating: 4.4,
  ),
  ProductModel(
    productImage: "coffee-2.png",
    productName: "Irish Coffee",
    productDescription: "with Irish whiskey",
    productPrice: 6.99,
    productRating: 4.9,
  ),
  ProductModel(
    productImage: "coffee-3.png",
    productName: "Affogato",
    productDescription: "Espresso with ice cream",
    productPrice: 5.49,
    productRating: 4.7,
  ),
  ProductModel(
    productImage: "coffee-4.png",
    productName: "Americano",
    productDescription: "Espresso with hot water",
    productPrice: 4.25,
    productRating: 4.3,
  ),
  ProductModel(
    productImage: "coffee-3.png",
    productName: "Flat White",
    productDescription: "Espresso with steamed milk",
    productPrice: 5.99,
    productRating: 4.8,
  ),
  ProductModel(
    productImage: "coffee-4.png",
    productName: "Vienna",
    productDescription: "with Whipped cream",
    productPrice: 5.49,
    productRating: 4.6,
  ),
];