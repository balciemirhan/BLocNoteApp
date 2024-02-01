import 'package:crud_operations/auth/login_or_register.dart';
import 'package:crud_operations/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Dinleyici --> kullanıcı'nın giriş yapıp yapmadığını kontrol edeceğim.

/* 'AuthGate' widget'ı, bir kullanıcının Firebase Authentication'ı kullanarak oturum açıp açmadığını belirlemek için bir ağ geçidi denetleyicisi görevi görecek şekilde tasarlanmıştır. Kimlik doğrulama durumundaki değişiklikleri dinlemek için bir "StreamBuilder" kullanır ve bir kullanıcının kimliğinin doğrulanıp doğrulanmadığına bağlı olarak koşullu olarak "Ana Sayfa" veya "LoginOrRegister" widget'ını görüntüler.  */

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
// snapshot.hasData =  akışın boş olmayan bir değer yayıp yaymadığını kontrol ediyor. StreamBuilder sınıfından geliyor. Kimliği doğrulanmış mı? doğrulanmamış mı? kısmını dinler. (true / false)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Kullanıcı giriş yapar ise Ana Sayfaya Yönlendirilsin.
          if (snapshot.hasData) {
            return const HomePage();
          }
          // Kullanıcı girişi yapamaz ise Login sayfasına Yönlendirilsin.
          return const LoginOrRegister();
        },
      ),
    );
  }
}
