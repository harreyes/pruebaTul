part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class OnConfirmCart extends CartEvent {
  OnConfirmCart();
}

class OnAddCart extends CartEvent {
  final QueryDocumentSnapshot product;
  OnAddCart(this.product);
}

class OnRemoveCart extends CartEvent {
  final QueryDocumentSnapshot product;
  OnRemoveCart(this.product);
}
