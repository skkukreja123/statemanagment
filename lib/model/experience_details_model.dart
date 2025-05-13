class ExperienceDetailsModel {
  String? id;
  String? company_name;
  String? description;
  String? imageUrl;
  String? location;
  String? date;
  String? time;
  String? duration;
  String? salaries;
  String? position;

  Map<String, String>? extraData;

  ExperienceDetailsModel({
    this.id,
    this.company_name,
    this.description,
    this.position,
    this.imageUrl,
    this.location,
    this.date,
    this.time,
    this.duration,
    this.salaries,
    this.extraData,
  });

  ExperienceDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    description = json['description'];
    imageUrl = json['image_url'];
    location = json['location'];
    date = json['date'];
    time = json['time'];
    duration = json['duration'];
    salaries = json['salaries'];
    position = json['position'];
    extraData = json['extra_data'] != null
        ? Map<String, String>.from(json['extra_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['location'] = location;
    data['date'] = date;
    data['time'] = time;
    data['duration'] = duration;
    data['salaries'] = salaries;
    data['position'] = position;
    if (extraData != null) {
      data['extra_data'] = extraData;
    }
    return data;
  }
}
