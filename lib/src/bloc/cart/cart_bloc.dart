import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is OnAddCart) {
      final prod = List<QueryDocumentSnapshot>.from(state.listProducts)
        ..add(event.product);
      yield state.copyWith(listProducts: prod, countCart: prod.length);
    } else if (event is OnRemoveCart) {
      final prod = List<QueryDocumentSnapshot>.from(state.listProducts)
        ..remove(event.product);
      // await FirebaseFirestore.instance
      //     .collection('product_carts')
      //     .doc(event.product.id)
      //     .delete();
      yield state.copyWith(listProducts: prod, countCart: prod.length);
    } else if (event is OnConfirmCart) {
      state.listProducts.forEach((element) {
        FirebaseFirestore.instance
            .collection('product_carts')
            .add({'cart_id': 'zQU8DvyzljvclLCYmIIY', 'product_id': element.id});
      });
      yield CartState(listProducts: const []);
    }
  }
}
