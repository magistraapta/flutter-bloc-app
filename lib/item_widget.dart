import 'package:flutter/material.dart';
import 'package:movie_app/models/product_model.dart';
import 'package:movie_app/product_detail.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.deepPurple,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
              tag: product.images[0],
              child: SizedBox(
                width: 150,
                child: Image.network(product.images[0]),
              )),
          SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: TextStyle(fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Text('USD ${product.price}'),
            ],
          ),

          // Spacer(),
          FilledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductDetail(product: product);
                }));
              },
              child: Text('Detail'))
        ],
      ),
    );
  }
}
