import 'package:flutter/material.dart';
import 'package:productopage/src/model/producto_model.dart';
import 'package:productopage/src/pages/producto_detalle.dart';
import 'package:provider/provider.dart';


class ProductosSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ProductosSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!this.fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProductoDetalle()));
        }
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 30, 
          vertical:   (this.fullScreen) ? 5 : 0, ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (!this.fullScreen) 
            ? BorderRadius.circular(50)
            : BorderRadius.only(bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))
          ),
          child: Column(
            children: [
              _ProductoConSombra(),

              if(!this.fullScreen)
              _ProductoOpciones()

            ],
          )    
        ),
      ),
    );
  }
}

class _ProductoOpciones extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        
         
          _CuadrosDeOpciones(7.5),
          _CuadrosDeOpciones(8),
          _CuadrosDeOpciones(8.5),
          _CuadrosDeOpciones(9),
          _CuadrosDeOpciones(9.5),
          _CuadrosDeOpciones(10),
          
        ],
      ),
    );
  }
}

class _CuadrosDeOpciones extends StatelessWidget {

  final double opcion;

  const _CuadrosDeOpciones(this.opcion);
  

  @override
  Widget build(BuildContext context) {

    final productoModel = Provider.of<ProductoModel>(context);

    return GestureDetector(
      onTap: (){
        final productoModel = Provider.of<ProductoModel>(context, listen: false);
        productoModel.talla = this.opcion;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("${opcion.toString().replaceAll(".0", "")}", 
        style: TextStyle(color: (this.opcion == productoModel.talla) ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold, fontSize: 16),),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (this.opcion == productoModel.talla) ? Colors.orangeAccent : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.opcion == productoModel.talla)
            BoxShadow(color: Colors.orangeAccent, blurRadius: 10,offset: Offset(0,5))
            
          ]
        ),
      ),
    );
  }
}

class _ProductoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productoModel = Provider.of<ProductoModel>(context);

    return Padding(
      padding: EdgeInsets.all(40),
      child: Stack(
        children: [

          _Sombra(),
          
          Image(image: AssetImage(productoModel.assetImage))
        ],
      ),
    );
  }
}

class _Sombra extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}