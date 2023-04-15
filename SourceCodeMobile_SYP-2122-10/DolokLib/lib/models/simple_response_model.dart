class SimpleResponseModel {
    SimpleResponseModel({
      required this.message,
    });

    final String message;

    factory SimpleResponseModel.fromJson(Map<String, dynamic> json) => SimpleResponseModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}