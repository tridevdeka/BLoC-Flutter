import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeWishlistButtonNavigateEvent>(_homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(_homeCartButtonNavigateEvent);
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
