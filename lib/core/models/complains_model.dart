class ComplainsModel {
  String? userId;
  String? doctorsName;
  String? complains;

  ComplainsModel({this.userId, this.doctorsName, this.complains});

  factory ComplainsModel.fromJson(Map<String, dynamic> json) {
    return ComplainsModel(
      userId: json['userId'],
      doctorsName: json['doctorsName'],
      complains: json['complains'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['doctorsName'] = doctorsName;
    data['complains'] = complains;
    return data;
  }
}
