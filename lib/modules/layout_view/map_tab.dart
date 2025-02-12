import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:flutter/material.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, PagesRouteName.signIn);
        }, child: const Text("Sign in")),
      ),
    );
  }
}
