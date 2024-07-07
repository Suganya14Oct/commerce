
class Product{

  final String name;
  final int price;
  final String image;
  final String desc;
  final int id;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
    required this.id
  });
}

List<Product> products = [
  Product(name: 'Honey Lime Combo', price: 200, image: 'assets/fud1.png', desc: 'Strawberries, Pineapple, Blueberries, Red grapes, Kiwi, Mandarin oranges, Bananas, Honey, Limes',id: 1),
  Product(name: 'Berry Mango Combo', price: 800, image: 'assets/fud2.png', desc: 'Mango Chunks, Strawberries, and Wild Blueberries.',id: 2),
  Product(name: 'Pina Colada Combo', price: 290, image: 'assets/food3.jpg', desc: 'Coconut, Rum, Pineapple Juice, Coconut Cream, Sugar Syrup',id: 3),
  Product(name: 'Tangy Poppy Seed Combo', price: 289, image: 'assets/food4.jpg', desc: 'Pineapple, Orange, Kiwi, Seedless grapes, Strawberries,Lime, Honey, poppy seeds',id: 4),
  Product(name: 'Fresh Fruit Bowl', price: 232, image: 'assets/food5.jpg', desc: 'Watermelon, Pineapple, Red Grapes, Strawberries, Berries',id: 5),
  Product(name: 'Minted Fruit Salad', price: 300, image: 'assets/food6.jpg',desc: 'Apple Juice, Honey, Ginger, Lemon Juice, Cantaloupe balls, Strawberries, Blueberries, Mint Leaves',id: 6),
  Product(name: 'Mint & Melon Salad', price: 300, image: 'assets/food7.jpg',desc: 'Honey, Lemon Juice, Melon Cubes, Fresh Mint',id: 7),
];

List<Product> hottestProducts = [
  Product(name: 'Quinoa fruit Salad', price: 100, image: 'assets/fruit1.webp', desc: 'Red Quinoa Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',id: 8),
  Product(name: 'Tropical fruit Salad', price: 50, image: 'assets/fruit2.jpg',desc: 'Oranges, Strawberries, Shredded Coconut, Grapes',id: 9),
  Product(name: 'Mango Salad', price: 69, image: 'assets/fruit3.jpg',desc: 'Mango, Onion, Fresh basil & mint, Toasted peanuts, Lime, Honey, Ginger, Sea Salt',id: 10),
  Product(name: 'Mixed fruit Salad', price: 40, image: 'assets/fruit4.jpg', desc: 'fresh orange and lemon juices, brown sugar, pineapple, strawberries, kiwis, bananas, oranges and vanilla extract',id: 11),
  Product(name: 'Grilled Stone fruit Salad', price: 50, image: 'assets/fruit5.jpg', desc: 'Peaches, plums, butter, olive oil, honey, lime,salt, black pepper, cheese',id: 12),
  Product(name: 'Minted Fruit Salad', price: 300, image: 'assets/food6.jpg',desc: 'Apple Juice, Honey, Ginger, Lime, Cantaloupe balls, Strawberries, Mint Leaves.',id: 13),
  Product(name: 'Mint & Melon Salad', price: 300, image: 'assets/food7.jpg',desc: 'Honey, Lime, Melon Cubes, Fresh Mint',id: 14),
];

List<Product> popularProducts = [
  Product(name: 'Fruit Cup with Citrus Sauce', price: 50, image: 'assets/fruit6.jpg',desc: 'Orange Juice, White Wine, WHite Grape Juice, Lime, Sugar, Green Grapes',id: 15),
  Product(name: 'Winter fruit Salad', price: 80, image: 'assets/fruit7.jpg',desc: 'Clementine Oranges, pears, Apples, Pomegranate, Kiwis',id: 16),
  Product(name: 'Sparkling fruit Salad', price: 4889, image: 'assets/fruit8.jpg',desc: 'Pineapple, Oranges, Strawberries, Green Grapes, Blueberries, White Wine, Lime',id: 17),
  Product(name: 'Citrus Salad', price: 68, image: 'assets/fruit9.jpg',desc: 'Citrus, Fennel, Radicchio, Avocado, Shaved pecorino cheese, Pine nuts, Fresh Mint',id: 18),
  Product(name: 'Mango Salad', price: 69, image: 'assets/fruit3.jpg', desc: 'Mango, Onion, Fresh basil & mint, Toasted peanuts, Lime, Honey, Ginger, Sea Salt',id: 19),
  Product(name: 'Mixed fruit Salad', price: 40, image: 'assets/fruit4.jpg', desc: 'fresh orange and lemon juices, brown sugar, pineapple, strawberries, kiwis, bananas, oranges and vanilla extract',id: 20),
  Product(name: 'Minty Pineapple Salad', price: 100, image: 'assets/fruit10.webp', desc: 'Fresh Pineapple, Fresh Mint, Maple Syrup',id: 21)
];

List<Product> newComboProducts = [
  Product(name: 'Slushy Fruit Salad', price: 100, image: 'assets/fruit11.jpg',desc: 'Sugar, Frozen Orange Juice, Thawed Lemonade, Bananas, Sliced peaches, Pineapple chunks',id: 22),
  Product(name: 'Avacado Fruit Salad', price: 60, image: 'assets/fruit12.jpg',desc: 'Plain Yogurt, Honey, Lime, Avocados, Apple, Seedless grapes, Mandarin Oranges, Banana',id: 23),
  Product(name: 'Two-Berry Fluff Salad', price: 70, image: 'assets/fruit13.jpg',desc: 'Cream Cheese, Sugar, Whipping Cream, Strawberries, Blueberries',id: 24),
  Product(name: 'Berry Nectarine Salad', price: 160, image: 'assets/fruit14.jpg',desc: 'Nectarines, Sugar, Lime, Ground Ginger, Cream Cheese, Raspberries, Blueberries',id: 25),
  Product(name: 'Cruncy Apple Salad', price: 180, image: 'assets/fruit15.jpg',desc: 'Apples, Chopped Celery, Raisins, Chopped Walnuts, Mayonnaise',id: 26),
  Product(name: 'Citrus Salad', price: 68, image: 'assets/fruit9.jpg', desc: 'Citrus, Fennel, Radicchio, Avocado, Shaved pecorino cheese, Pine nuts, Fresh Mint',id: 27),
  Product(name: 'Grilled Stone fruit Salad', price: 50, image: 'assets/fruit5.jpg', desc: 'Peaches, plums, butter, olive oil, honey, lime,salt, black pepper, cheese',id: 28),
];

List<Product> topProducts = [
  Product(name: 'Citrus Salad', price: 68, image: 'assets/fruit9.jpg', desc: 'Citrus, Fennel, Radicchio, Avocado, Shaved pecorino cheese, Pine nuts, Fresh Mint',id: 29),
  Product(name: 'Cruncy Apple Salad', price: 180, image: 'assets/fruit15.jpg', desc: 'Apples, Chopped Celery, Raisins, Chopped Walnuts, Mayonnaise',id: 30),
  Product(name: 'Mango Salad', price: 69, image: 'assets/fruit3.jpg', desc: 'Mango, Onion, Fresh basil & mint, Toasted peanuts, Lime, Honey, Ginger, Sea Salt',id: 31),
  Product(name: 'Fruit Cup with Citrus Sauce', price: 50, image: 'assets/fruit6.jpg', desc: 'Orange Juice, White Wine, Lime, Sugar, Cantaloupe balls, Green grapes, Strawberries',id: 32),
  Product(name: 'Avacado Fruit Salad', price: 60, image: 'assets/fruit12.jpg', desc: 'Plain Yogurt, Honey, Lime, Avocados, Apple, Seedless grapes, Mandarin Oranges, Banana',id: 33),
  Product(name: 'Mixed fruit Salad', price: 40, image: 'assets/fruit4.jpg', desc: 'fresh orange and lemon juices, brown sugar, pineapple, strawberries, kiwis, bananas, oranges and vanilla extract',id: 34),
  Product(name: 'Two-Berry Fluff Salad', price: 70, image: 'assets/fruit13.jpg', desc: 'Cream Cheese, Sugar, Whipping Cream, Strawberries, Blueberries,',id: 35),
];