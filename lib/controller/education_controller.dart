import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx/model/education_details_model.dart';

class EducationController extends GetxController {
  final Rx<EducationDetailsModel> educationDetails =
      EducationDetailsModel().obs;

  void updateEducationDetails(EducationDetailsModel details) {
    educationDetails.value = details;
  }

  void clearEducationDetails() {
    educationDetails.value = EducationDetailsModel();
  }

  Map<String, dynamic> getEducationDetails() {
    return educationDetails.value.toJson();
  }

  void setEducationDetails(Map<String, dynamic> details) {
    educationDetails.value = EducationDetailsModel.fromJson(details);
  }

  void addExtraData(String key, String value) {
    final field = educationDetails.value.extraData ?? {};
    field[key] = value;
    educationDetails.update((val) {
      val?.extraData = field;
    });
  }
}
