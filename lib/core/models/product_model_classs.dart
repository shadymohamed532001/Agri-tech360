import 'package:equatable/equatable.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

class ProductModelClass extends Equatable {
  final StoreProductModel productModel;

  const ProductModelClass({
    required this.productModel,
  });

  @override
  List<Object?> get props => [
        productModel,
      ];
}
