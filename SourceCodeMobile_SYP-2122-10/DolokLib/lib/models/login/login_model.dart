class LoginModel {
    LoginModel({
      required this.accessToken,
      required this.tokenType,
      required this.expires,
    });

    final String accessToken;
    final String tokenType;
    final int expires;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expires: json["expires"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires": expires,
    };
}