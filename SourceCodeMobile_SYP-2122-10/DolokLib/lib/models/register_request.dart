class RegisterRequest {
  final String name;
  final String email;
  final String phone;
  final String alamat;
  final String password;

  RegisterRequest({
    required this.name,
    required this.alamat,
    required this.email,
    required this.password,
    required this.phone,
  });
}
