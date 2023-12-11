import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/product_model.dart';
import 'package:http/http.dart' as http;
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProducts() async {
    try {
      emit(ProductLoading());
      final response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));

      emit(ProductSuccess(product: productFromJson(response.body)));
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}
