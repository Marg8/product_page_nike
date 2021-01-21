import 'package:flutter/material.dart';

class ProductoDescripcion extends StatelessWidget {

  final String titulo;
  final String descripcion;

  const ProductoDescripcion({
    @required this.titulo,
    @required this.descripcion
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(this.titulo, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text(this.descripcion, style: TextStyle(height: 1.5))

          ],
        ),
        
      ),
    );
  }
}