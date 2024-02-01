import 'package:crud_operations/core/theme/text.dart';
import 'package:crud_operations/core/widgets/now_bottom.dart';
import 'package:crud_operations/pages/register/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, this.onTap}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: mediaQuery.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /* ----------------------- Image / Decore -----------------------  */

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* ----------------------- Register Form -----------------------  */

                  RegisterForm(formKey: formKey),

                  /* ----------------------- Register Now -----------------------  */

                  Padding(
                    padding: EdgeInsets.only(top: mediaQuery.height / 15),
                    child: NowBottom(
                      text: AppText.already,
                      text2: AppText.loginNow,
                      onTap: () => onTap!(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
