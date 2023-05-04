class MedicineModel{
  String? userId;
  String? medicineName;
  String? medicineTime;
  String? medicineFrom;
  String? medicineTo;
  String? repetition;

  MedicineModel({this.userId,this.medicineName, this.medicineTime, this.medicineFrom, this.medicineTo, this.repetition});

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      userId: json['userId'],
      medicineName: json['medicineName'],
      medicineTime: json['medicineTime'],
      medicineFrom: json['medicineFrom'],
      medicineTo: json['medicineTo'],
      repetition: json['repetition'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['medicineName'] = medicineName;
    data['medicineTime'] = medicineTime;
    data['medicineFrom'] = medicineFrom;
    data['medicineTo'] = medicineTo;
    data['repetition'] = repetition;
    return data;
  }
}