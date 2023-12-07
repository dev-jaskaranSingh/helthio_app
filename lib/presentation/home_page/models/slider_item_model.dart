/// This class is used in the [sliderone_item_widget] screen.
class SliderItemModel {
  SliderItemModel({
    this.title,
    this.id,
  }) {
    title = title ?? "Early protection for\nyour family health";
    id = id ?? "";
  }

  String? title;

  String? id;
}
