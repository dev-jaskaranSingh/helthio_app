import '../../../core/app_export.dart';
import 'appointment_item_model.dart';
import 'categories_item_model.dart';
import 'slider_item_model.dart';

class HomeModel {
  List<SliderItemModel> sliderItemList = [
    SliderItemModel(earlyProtection: "Early protection for\nyour family health")
  ];

  List<CategoriesItemModel> categoriesItemList = [
    CategoriesItemModel(
        orthopaedics: ImageConstant.img617717311,
        orthopaedics1: "Orthopaedics"),
    CategoriesItemModel(
        orthopaedics: ImageConstant.img6177173112,
        orthopaedics1: "Ophthalmology")
  ];

  List<AppointmentItemModel> appointmentItemList = [
    AppointmentItemModel(
        name: "Dr. Marcus Horizon",
        speciality: "Chardiologist",
        date: "12 Jun 2023",
        time: "2:30 PM"),
    AppointmentItemModel(
        name: "Dr. Marcus Horizon",
        speciality: "Chardiologist",
        date: "12 Jun 2023",
        time: "2:30 PM")
  ];
}
