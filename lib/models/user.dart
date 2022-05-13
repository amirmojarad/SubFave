class User {
  final String username, token, email;
  const User({
    required this.email,
    required this.token,
    required this.username,
  });
  
  void load() async{
    // TODO load user data from sharedprefrences
  }

  void save() async {
    // TODO save user to sharedPrefrences
  }
}
