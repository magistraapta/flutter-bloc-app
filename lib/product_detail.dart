import 'package:flutter/material.dart';
import 'package:movie_app/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('item detail'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(tag: product.images[0], child: Image.network(product.images[0])),
          SizedBox(height: 12,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
                SizedBox(height: 8,),
                Text(product.description),
                SizedBox(height: 12,),
                Text('USD ${product.price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
              ],
            ),
          )
        ],
      )),
    );
  }
}
