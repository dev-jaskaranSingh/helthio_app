/// This class is used in the [listhome_item_widget] screen.
class AppointmentItemModel {
  AppointmentItemModel({
    this.name,
    this.speciality,
    this.date,
    this.time,
    this.id,
  }) {
    name = name ?? "Dr. Marcus Horizon";
    speciality = speciality ?? "Chardiologist";
    date = date ?? "12 Jun 2023";
    time = time ?? "2:30 PM";
    id = id ?? "";
  }

  String? name;

  String? speciality;

  String? date;

  String? time;

  String? id;
}
