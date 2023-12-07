import 'time_slot_item_model.dart';

class DoctorDetailModel {
  String drMarcusHorizon = "";

  String chardiologist = "";

  String fortySeven = "";

  String distance = "";

  List<TimeSlotItemModel> amItemList =
      List.generate(9, (index) => TimeSlotItemModel());
}
