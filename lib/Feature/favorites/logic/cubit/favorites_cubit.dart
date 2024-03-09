import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.favoritesRepo}) : super(FavoritesInitial());

  final FavoritesRepo favoritesRepo;

  List<FavoriteData> favoritesResult = [];

  void getFavorites() async {
    emit(const GetFavoritesLoadingState());

    final favoriteEither = await favoritesRepo.getFavorites();

    favoriteEither.fold(
      (failure) {
        print(failure.errMessage.toString());
        emit(GetFavoritesErrorState(error: failure.errMessage.toString()));
      },
      (favorites) {
        favoritesResult = favorites;
        print(favorites[0]);
        emit(GetFavoritesSuccessState(favorites: favorites));
      },
    );
  }
}
