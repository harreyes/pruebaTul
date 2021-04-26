part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddCart extends CartEvent {
  final num number;

  AddCart(this.number);
}

class ConfirmCart extends CartEvent {
  ConfirmCart();
}

class SetIdCart extends CartEvent {
  final String docId;
  SetIdCart(this.docId);
}
