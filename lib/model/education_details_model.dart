class EducationDetailsModel {
  String? id;
  String? name;
  String? degree;
  String? university;
  String? startDate;
  String? endDate;
  String? description;
  String? yearOfPassing;

  Map<String, String>? extraData;

  EducationDetailsModel({
    this.id,
    this.name,
    this.degree,
    this.university,
    this.startDate,
    this.endDate,
    this.description,
    this.yearOfPassing,
    this.extraData,
  });

  EducationDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    degree = json['degree'];
    university = json['university'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    yearOfPassing = json['year_of_passing'];
    extraData = json['extra_data'] != null
        ? Map<String, String>.from(json['extra_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['degree'] = degree;
    data['university'] = university;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['year_of_passing'] = yearOfPassing;
    if (extraData != null) {
      data['extra_data'] = extraData;
    }
    return data;
  }
}
