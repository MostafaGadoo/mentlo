class AppointmentModel {
  final String date;
  final String time;
  final String userId;
  final String doctorId;
  final String appointmentId;

  AppointmentModel({
    required this.date,
    required this.time,
    required this.userId,
    required this.doctorId,
    required this.appointmentId,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      date: json['date'],
      time: json['time'],
      userId: json['Uid'],
      doctorId: json['doctorId'],
      appointmentId: json['appointmentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'Uid': userId,
      'doctorId': doctorId,
      'appointmentId': appointmentId,
    };
  }
}
