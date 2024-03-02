import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit({required this.storeRepo}) : super(StoreInitial());

  static StoreCubit getObject(context) => BlocProvider.of<StoreCubit>(context);

  final StoreRepo storeRepo;

  List<StoreProductModel> productResult = <StoreProductModel>[];

  Future<void> getProducts() async {
    emit(StoreGetProductsLoading());
    final porductEither = await storeRepo.getStoreData();

    porductEither.fold((falier) {
      return emit(StoreGetProductsError(error: falier.toString()));
    }, (products) {
      productResult = products;
      return emit(StoreGetProductsSuccess(products: products));
    });
  }
}
