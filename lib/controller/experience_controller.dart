import 'package:get/get.dart';

import '../model/experience_details_model.dart';

class ExperienceController extends GetxController {
  final Rx<ExperienceDetailsModel> experienceDetails =
      ExperienceDetailsModel().obs;

  void updateExperienceDetails(ExperienceDetailsModel details) {
    experienceDetails.value = details;
  }

  void clearExperienceDetails() {
    experienceDetails.value = ExperienceDetailsModel();
  }

  Map<String, dynamic> getExperienceDetails() {
    return experienceDetails.value.toJson();
  }

  void setExperienceDetails(Map<String, dynamic> details) {
    experienceDetails.value = ExperienceDetailsModel.fromJson(details);
  }

  void addExtraData(String key, String value) {
    final field = experienceDetails.value.extraData ?? {};
    field[key] = value;
    experienceDetails.update((val) {
      val?.extraData = field;
    });
  }
}
