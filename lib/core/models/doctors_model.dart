class DoctorModel {
  final String appointmentId;
  final String doctorId;
  final String email;
  final String imageUrl;
  final String location;
  final String name;
  final String specialization;
  final String from;
  final String to;
  final String phone;

  DoctorModel({
    required this.appointmentId,
    required this.doctorId,
    required this.email,
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.specialization,
    required this.from,
    required this.to,
    required this.phone,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      appointmentId: json['appointmentId'],
      doctorId: json['doctorId'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      name: json['name'],
      specialization: json['specialization'],
      from: json['from'],
      to: json['to'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['doctorId'] = doctorId;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['location'] = location;
    data['name'] = name;
    data['specialization'] = specialization;
    data['from'] = from;
    data['to'] = to;
    data['phone'] = phone;
    return data;
  }
}
