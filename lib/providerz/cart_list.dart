import 'package:commerce/models/cart_model.dart';
import 'package:commerce/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class AddtoCartState extends Equatable {

  final List<CartModel> items;
  AddtoCartState({required this.items});

  factory AddtoCartState.initial(){

    return AddtoCartState(items: []);
  }

  @override
  List<Object?> get props => [items];

  @override
  bool get stringify => true;

  AddtoCartState copyWith({
    List<CartModel>? item,
  }){
    return AddtoCartState(
      items: item ?? this.items,
    );
  }
}

class AddtoCart extends StateNotifier<AddtoCartState> {
  AddtoCart() : super(AddtoCartState.initial());

  void addToCart(CartModel item) {
    state = state.copyWith(item: [...state.items, item]);
  }

  void removeFromCart(CartModel item) {
    state = state.copyWith(
      item: state.items.where((cartItem) => cartItem != item).toList()
    );
  }

}
