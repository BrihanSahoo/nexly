class SignUpRequest {
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;

  const SignUpRequest({
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}
