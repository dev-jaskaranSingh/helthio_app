/// This class is used in the [topdoctor_item_widget] screen.
class TopDoctorItemModel {
  TopDoctorItemModel({
    this.name,
    this.speciality,
    this.rating,
    this.distance,
    this.id,
  }) {
    name = name ?? "Dr. Marcus Horizon D";
    speciality = speciality ?? "Chardiologist";
    rating = rating ?? "4.7";
    distance = distance ?? "800m away";
    id = id ?? "";
  }

  String? name;

  String? speciality;

  String? rating;

  String? distance;

  String? id;
}
