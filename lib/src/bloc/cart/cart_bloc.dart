import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddCart) {
      yield CartState(countCart: state.countCart + 1);
    } else if (event is ConfirmCart) {
      yield CartState(countCart: 0);
    } else if (event is SetIdCart) {
      yield CartState(docId: event.docId);
    }
  }
}
