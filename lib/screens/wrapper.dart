import 'package:gymcontrol/screens/myHome.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.uid != null ? MyHomePage() : Authenticate();
  }
}