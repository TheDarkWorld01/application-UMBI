class Product {
  final String name;
  final String description;
  final String imagePath;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });
}

// Objek-objek produk yang berdiri sendiri
Product friedChicken = Product(
  name: "Fried Chicken",
  description: "Ayam tepung digoreng",
  imagePath: "asset/images/1.png",
  price: 18000.0,
);

Product burgerDeluxe = Product(
  name: "Burger Deluxe",
  description: "Burger Extra Besar",
  imagePath: "asset/images/2.png",
  price: 35000.0,
);

Product sushiSalmon = Product(
  name: "Sushi Salmon",
  description: "Fish Sushi Seaweed",
  imagePath: "asset/images/3.png",
  price: 45000.0,
);

Product takoyaki = Product(
  name: "Takoyaki Omayo",
  description: "Gurita goreng",
  imagePath: "asset/images/4.png",
  price: 45000.0,
);

Product orangeJuice = Product(
  name: "Orange Juice",
  description: "Jus Jeruk",
  imagePath: "asset/images/5.png",
  price: 5000.0,
);

Product cola = Product(
  name: "Coca Cola",
  description: "Coca Cola",
  imagePath: "asset/images/6.png",
  price: 5000.0,
);

Product coco = Product(
  name: "Coconut Syrup",
  description: "Sirup Kelapa",
  imagePath: "asset/images/7.png",
  price: 8000.0,
);

Product EsTehIndonesia = Product(
  name: "Es Teh Indonesia",
  description: "Es Teh Mamanx",
  imagePath: "asset/images/8.png",
  price: 8000.0,
);
