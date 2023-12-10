import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      // TODO: implement event handler
      final response = await http.get(
          Uri.parse(
              'https://api.escuelajs.co/api/v1/products?offset=0&limit=10'),
          headers: {"Content-Type": "application/json"});
      emit(ProductSuccess(products: productFromJson(response.body)));
    });
  }
}
