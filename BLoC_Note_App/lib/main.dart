import 'package:crud_operations/auth/auth_gate.dart';
import 'package:crud_operations/blocs/auth_bloc/auth_bloc.dart';
import 'package:crud_operations/firebase_options.dart';
import 'package:crud_operations/repositories/auth_repository.dart';
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
        create: (context) => AuthBloc(
          authRepository: AuthRepository(),
        ),
      ),
      /*    BlocProvider(
        create: (context) => UserBloc(),
      ), */
    ],
    child: MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'BLoC Note App',
      theme: ThemeData(useMaterial3: true),
      home: const AuthGate(),
    ),
  ));
}
