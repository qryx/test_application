import 'package:flutter/material.dart';
import 'package:test_application/setup_services.dart';
import 'package:test_application/test_application_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const TestApplicationApp());
}
