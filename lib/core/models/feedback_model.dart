class FeedbackModel {
  String? userId;
  String? message;
  double? rating;

  FeedbackModel({this.userId, this.message, this.rating});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      userId: json['userId'],
      message: json['message'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['message'] = message;
    data['rating'] = rating;
    return data;
  }
}
