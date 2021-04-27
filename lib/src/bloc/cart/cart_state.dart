part of 'cart_bloc.dart';

class CartState {
  final num countCart;
  final String stateCart;
  final QueryDocumentSnapshot products;
  final List<QueryDocumentSnapshot> listProducts;
  CartState(
      {this.countCart = 0,
      this.stateCart,
      this.listProducts = const [],
      this.products});

  CartState copyWith(
          {QueryDocumentSnapshot products,
          List<QueryDocumentSnapshot> listProducts,
          num countCart}) =>
      CartState(
          products: products ?? products,
          listProducts: listProducts ?? this.listProducts,
          countCart: countCart ?? this.countCart);
}
