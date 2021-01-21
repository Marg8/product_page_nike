import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final String texto;

  CustomAppBar({@required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          
          width: double.infinity,
          height: 100,
          
          child: Row(
            children: [
              Text(this.texto, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Spacer(),
              Icon(Icons.search, size: 30,)

            ],
          ), 
          
        ),
      ),
    );
  }
}