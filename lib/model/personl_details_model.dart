class PersonalDetailsModel {
  String? name;
  String? email;
  String? phone;
  String? address;

  Map<String, String>? extraData;

  PersonalDetailsModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.extraData,
  });

  PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    extraData = json['extraData'] != null
        ? Map<String, String>.from(json['extraData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    if (extraData != null) {
      data['extraData'] = extraData;
    }
    return data;
  }
}
