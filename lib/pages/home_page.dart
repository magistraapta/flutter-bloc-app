import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/cubit/auth_cubit.dart';
import 'package:movie_app/cubit/product_cubit.dart';
import 'package:movie_app/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).userLogout();
          },
          icon: Icon(Icons.logout),
        ),
        title: Text(
          'Product',
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSuccess) {
            return Container(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.65),
                itemBuilder: (context, index) {
                  return ItemWidget(product: state.product[index]);
                },
                itemCount: state.product.length,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
