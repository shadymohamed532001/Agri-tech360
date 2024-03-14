import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class CommentDataSourcesImpl extends CommentDataSources {
  @override
  Future<List<CommentModel>> addComment({
    required String comment,
    required int productId,
  }) async {
    String token = await LocalServices.getData(key: 'token');
    FormData formData = FormData.fromMap({
      'comment': comment,
      'product': productId,
    });

    var response = await ApiServices.postFormData(
      formData: formData,
      endpoint: '$baseUrl$addcommentendpoint', // Corrected endpoint
      token: token,
    );

    List<CommentModel> comments = [];

    if (response.containsKey('comment')) {
      // Check for 'comment' key instead of 'data'
      comments.add(CommentModel.fromJson(response['comment']));
      return comments;
    }
    return comments; // Return empty list if 'comment' key is not present in response
  }
}
