/// This class is used in the [gridhome_item_widget] screen.
class CategoriesItemModel {
  CategoriesItemModel({
    this.orthopaedics,
    this.orthopaedics1,
    this.id,
  }) {
    orthopaedics = orthopaedics ?? "...";
    orthopaedics1 = orthopaedics1 ?? "Orthopaedics";
    id = id ?? "";
  }

  String? orthopaedics;

  String? orthopaedics1;

  String? id;
}
