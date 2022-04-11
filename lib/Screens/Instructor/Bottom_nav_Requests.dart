import 'package:flutter/material.dart';

import '../../widgets/Requestlist.dart';
class Bot_Nav_reqlist extends StatefulWidget {
  const Bot_Nav_reqlist({Key? key}) : super(key: key);

  @override
  State<Bot_Nav_reqlist> createState() => _Bot_Nav_reqlistState();
}

class _Bot_Nav_reqlistState extends State<Bot_Nav_reqlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Reqlist(),
    );
  }
}
