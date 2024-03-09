import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.favoritesRepo}) : super(FavoritesInitial());

  final FavoritesRepo favoritesRepo;
  List<FavoriteData> favoritesResult = [];
  Set<int> favoritId = {}; // Define favoritId at the class level

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
        for (var element in favorites) {
          favoritId.add(element.id);
        }
        emit(GetFavoritesSuccessState(favorites: favorites));
      },
    );
  }

  void addOrRemoveFavorites({required int productId}) {
    favoritesRepo.addOrRemoveFavorite(productId: productId).then((value) {
      value.fold((failure) {
        emit(AddOrRemoveFavorItemsErrorState(
          error: failure.errMessage.toString(),
        ));
      }, (response) async {
        if (favoritId.contains(productId)) {
          favoritId.remove(productId);
        } else {
          favoritId.add(productId);
        }

        getFavorites();
        emit(AddOrRemoveFavorItemsSuccessState());
      });
    });
  }
}
