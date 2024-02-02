import 'package:crud_operations/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:crud_operations/business_logic/blocs/user_bloc/user_bloc.dart';
import 'package:crud_operations/business_logic/repositories/user_repository.dart';
import 'package:crud_operations/firebase_options.dart';
import 'package:crud_operations/business_logic/repositories/auth_repository.dart';
import 'package:crud_operations/pages/register/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final navigatorKey = GlobalKey<NavigatorState>();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(AuthRepository(), UserRepository()),
      ),
      BlocProvider<UserBloc>(
        create: (context) => UserBloc(
          UserRepository(),
        ),
      ),
    ],
    child: MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'BLoC Note App',
      theme: ThemeData(useMaterial3: true),
      home: RegisterPage(),
    ),
  ));
}
