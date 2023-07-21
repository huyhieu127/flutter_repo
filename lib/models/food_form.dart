class FoodForm {
  String image;
  String name;
  String desc;
  int price;
  int amount;

  FoodForm({required this.image, required this.name, this.desc = "", this.price = 0, this.amount = 0});
}
