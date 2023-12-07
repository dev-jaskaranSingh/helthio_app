/// This class is used in the [gridhome_item_widget] screen.
class CategoriesItemModel {
  CategoriesItemModel({
    this.image,
    this.name,
    this.id,
  }) {
    image = image ?? "...";
    name = name ?? "Orthopaedics";
    id = id ?? "";
  }

  String? image;

  String? name;

  String? id;
}
