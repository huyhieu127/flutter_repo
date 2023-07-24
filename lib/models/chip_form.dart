class ChipForm{
  int id;
  String name;
  int type;
  bool isSelected;
  ChipForm({required this.id, required this.name, required this.type, this.isSelected = false});
}