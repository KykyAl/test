import 'package:brief_project/feature/login/presentation/widget/register_body.dart';
import 'package:flutter/material.dart';

class Mainregister extends StatefulWidget {
  const Mainregister({super.key});

  @override
  State<Mainregister> createState() => _MainregisterState();
}

class _MainregisterState extends State<Mainregister> {
  final Register register = Register();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: register.body(context),
    );
  }
}
