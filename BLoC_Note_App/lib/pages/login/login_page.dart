import 'package:crud_operations/core/theme/text.dart';
import 'package:crud_operations/core/widgets/now_bottom.dart';
import 'package:crud_operations/pages/login/login_divider.dart';
import 'package:crud_operations/pages/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, this.onTap}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;

    //Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            left: mWidth / 50, right: mWidth / 50, top: mHeight / 2.8),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /* ----------------------- Login Form -----------------------  */

                  LoginForm(formkey: formKey),

                  /* ----------------------- Login Divider -----------------------  */

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mHeight / 25),
                    child: const LoginDivider(),
                  ),

                  /* --------  Square Auth Buttons (Google / Apple Authentication) --------  */

                  /* ----------------------- Login Now -----------------------  */

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: NowBottom(
                      text: AppText.member,
                      text2: AppText.registerNow,
                      onTap: () => onTap!(),
                    ),
                  )
                  /* const LoginNow() */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
