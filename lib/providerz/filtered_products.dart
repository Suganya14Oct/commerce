import 'package:commerce/models/product_model.dart';
import 'package:commerce/models/todo_models.dart';
import 'package:commerce/providerz/product_list.dart';
import 'package:commerce/providerz/todo_filter.dart';
import 'package:commerce/providerz/todo_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';


class FilteredProductsState extends Equatable {

  final List<Product> filteredProducts;
  FilteredProductsState({required this.filteredProducts});

  factory FilteredProductsState.initial() {
    return FilteredProductsState(filteredProducts: []);
  }

  @override
  List<Object?> get props => [filteredProducts];

  @override
  bool? get stringify => true;

  FilteredProductsState copyWith({
    List<Product>? filteredProducts,
  }){
    return FilteredProductsState(
      filteredProducts: filteredProducts ?? this.filteredProducts,
    );
  }
}

class FilteredProducts extends StateNotifier<FilteredProductsState> with LocatorMixin {
  FilteredProducts() : super(FilteredProductsState.initial());

  @override
  void update(Locator watch) {
    final Filter filter = watch<TodoFilterState>().filter;
    final String searchTerm = watch<TodoSearchState>().searchTerm;
    final List<Product> products = watch<ProductListState>().products;

    List<Product> _filteredProducts = [];

    if(searchTerm.isNotEmpty){
      _filteredProducts = products.where((Product product) =>
          product.name.toLowerCase().contains(searchTerm.toLowerCase())
      ).toList();
    } else {
      _filteredProducts = List<Product>.from(products);
    }

    state = state.copyWith(filteredProducts: _filteredProducts);

    super.update(watch);
  }
}