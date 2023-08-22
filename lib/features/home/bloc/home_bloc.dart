import 'dart:async';

import 'package:bloc_state_management_flutter/data/grocery_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/home_product_data.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(_homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(_homeCartButtonNavigateEvent);
  }

  FutureOr<void> _homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      emit(HomeLoadedSuccessState(
          products: GroceryData.groceryProducts
              .map((eachProduct) =>
                  ProductDataModel(eachProduct['id'], eachProduct['name'], eachProduct['description'], eachProduct['price'], eachProduct['imageUrl']))
              .toList()));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  FutureOr<void> _homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> _homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
