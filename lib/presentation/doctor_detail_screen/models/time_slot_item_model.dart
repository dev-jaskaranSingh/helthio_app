/// This class is used in the [am_item_widget] screen.
class TimeSlotItemModel {
  TimeSlotItemModel({
    this.time,
    this.isSelected,
  }) {
    time = time ?? "09:00 AM";
    isSelected = isSelected ?? false;
  }

  String? time;

  bool? isSelected;
}
