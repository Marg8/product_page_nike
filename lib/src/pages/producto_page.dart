import 'package:flutter/material.dart';
import 'package:productopage/src/helpers/status_bar.dart';
import 'package:productopage/src/widgets/custom_widgets.dart';


class ProductoPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return  Scaffold(
        //body: CustomAppBar(texto: "Busqueda",)
        //body: ProductosSizePreview(),
        body: Column(
          children: [
            CustomAppBar(texto: "Busqueda"),
            SizedBox(height: 20,),

            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: "zapato-1",
                    child: ProductosSizePreview()),
                  ProductoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                  ), 
                                
                ],
              )
            )
            ),
            AgregarAlCarrito(monto: 180.0) 
          ],
        ),
      
    );
  }
}