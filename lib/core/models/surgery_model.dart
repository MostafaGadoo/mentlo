class SurgeryModel{
  final String appointmentId;
  final String doctorId;
  final String email;
  final String from;
  final String imageURL;
  final String name;
  final String phone;
  final String to;
  final String workingDays;

  SurgeryModel({
    required this.appointmentId,
    required this.doctorId,
    required this.email,
    required this.from,
    required this.imageURL,
    required this.name,
    required this.phone,
    required this.to,
    required this.workingDays,
  });

  factory SurgeryModel.fromJson(Map<String, dynamic> json) {
    return SurgeryModel(
      appointmentId: json['appointmentId'],
      doctorId: json['doctorId'],
      email: json['email'],
      name: json['name'],
      from: json['from'],
      to: json['to'],
      phone: json['phone'],
      imageURL: json['imageURL'],
      workingDays: json['workingDays'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['doctorId'] = doctorId;
    data['email'] = email;
    data['imageUrl'] = imageURL;
    data['name'] = name;
    data['from'] = from;
    data['to'] = to;
    data['phone'] = phone;
    data['workingDays'] = workingDays;
    return data;
  }
}