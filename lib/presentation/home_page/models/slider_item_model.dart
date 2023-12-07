/// This class is used in the [sliderone_item_widget] screen.
class SliderItemModel {
  SliderItemModel({
    this.earlyProtection,
    this.id,
  }) {
    earlyProtection =
        earlyProtection ?? "Early protection for\nyour family health";
    id = id ?? "";
  }

  String? earlyProtection;

  String? id;
}
