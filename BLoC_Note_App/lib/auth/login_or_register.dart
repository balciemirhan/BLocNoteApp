import 'package:crud_operations/pages/login/login_page.dart';
import 'package:crud_operations/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Başlangıçta giriş sayfasını göster

  bool showLoginPage = true;

// oturum açma arasında geçiş yapma ( Login page - Register Page)

  void togglePages() {
    setState(
      () {
        showLoginPage = !showLoginPage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(onTap: togglePages)
        : RegisterPage(onTap: togglePages);
  }
}
