class AppointmentModel {
  final String date;
  final String time;
  final String Uid;

  AppointmentModel({
    required this.date,
    required this.time,
    required this.Uid,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      date: json['date'],
      time: json['time'],
      Uid: json['Uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'Uid': Uid,
    };
  }
}
