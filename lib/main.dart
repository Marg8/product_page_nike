import 'package:flutter/material.dart';
import 'package:productopage/src/model/producto_model.dart';
import 'package:productopage/src/pages/producto_page.dart';
import 'package:provider/provider.dart';
 
void main(){

  return runApp(MultiProvider(
    providers: [
      
      ChangeNotifierProvider(create: (_) => ProductoModel()),
    ],
    child: MyApp()));
    
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Producto Page',
      home: ProductoPage(),
      //home: ProductoDetalle(),
      
    );
  }
}