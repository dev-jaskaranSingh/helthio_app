import 'time_slot_item_model.dart';

class DoctorDetailModel {
  String name = "";

  String speciality = "";

  String rating = "";

  String distance = "";

  List<TimeSlotItemModel> doctorItemList =
      List.generate(9, (index) => TimeSlotItemModel());
}
