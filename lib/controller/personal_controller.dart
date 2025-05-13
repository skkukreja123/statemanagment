import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx/model/personl_details_model.dart';

class PersonalController extends GetxController {
  // Add your controller logic here
  // For example, you can define methods to handle user data, preferences, etc.
  final Rx<PersonalDetailsModel> personalDetails = PersonalDetailsModel().obs;

  void updatePersonalDetails(PersonalDetailsModel details) {
    print('Updating personal details: $details');
    personalDetails.value = details;
  }

  void clearPersonalDetails() {
    personalDetails.value = PersonalDetailsModel();
  }

  Map<String, dynamic> getPersonalDetails() {
    return personalDetails.value.toJson();
  }

  void setPersonalDetails(Map<String, dynamic> details) {
    personalDetails.value = PersonalDetailsModel.fromJson(details);
  }

  void addExtraData(String key, String value) {
    final field = personalDetails.value.extraData ?? {};
    print('Adding extra data: $key = $value');
    print('Current extra data: ${personalDetails.value.extraData}');
    field[key] = value;
    personalDetails.update((val) {
      val?.extraData = field;
    });
  }
}
