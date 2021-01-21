

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:productopage/src/helpers/status_bar.dart';
import 'package:productopage/src/model/producto_model.dart';
import 'package:productopage/src/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class ProductoDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    cambiarStatusLight();

    return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "zapato-1",
                    child: ProductosSizePreview(fullScreen: true)),

                  Positioned(
                    top: 80,
                    child: FloatingActionButton(
                      child: Icon(Icons.chevron_left, color: Colors.white,size: 55,),
                      onPressed: (){
                        cambiarStatusDark();
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      highlightElevation: 0,
                    )),

                ],),
              
              Expanded(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductoDescripcion(
                     titulo: 'Nike Air Max 720',
                     descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),

                    _MontoBuyNow(),

                    _ColoresOpciones(),

                    _BotonesOpcionesBottom()
                  ],
                ),))
            ],
          ),
    );
  }
}

class _BotonesOpcionesBottom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BontonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BontonSombreado(Icon(Icons.add_shopping_cart, color: Colors.black.withOpacity(0.4), size: 25)),
          _BontonSombreado(Icon(Icons.settings, color: Colors.black.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BontonSombreado extends StatelessWidget {
  final Icon icon;

  const _BontonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        shape: BoxShape.circle
      ),

    );
  }
}

class _ColoresOpciones extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned( left: 90,child:_BotonColor(Color(0xff669933),4,"assets/imgs/verde.png")),
                Positioned( left: 60,child:_BotonColor(Color(0xffFFFF00),3,"assets/imgs/amarillo.png")),
                Positioned( left: 30,child:_BotonColor(Color(0xff669999),2,"assets/imgs/azul.png")),
                _BotonColor(Color(0xff000000),1, "assets/imgs/negro.png"),
              ],
            ),
          ),
          

          

          BotonNaranja(texto: "More related items", alto: 30, ancho: 170,)
          
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlImage;
  const _BotonColor(this.color, this.index, this.urlImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          final productoModel = Provider.of<ProductoModel>(context, listen: false);
          productoModel.assetImage = this.urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text("\$180.0", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: "Buy Now", ancho: 120, alto: 40,))
          ],
        ),
      ),
    );
  }
}