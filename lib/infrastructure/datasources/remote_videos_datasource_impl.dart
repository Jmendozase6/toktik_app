import 'package:dio/dio.dart';
import 'package:toktik_app/domain/datasources/video_posts_datasource.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/infrastructure/models/remote_video_model.dart';

class RemoteVideosDatasource implements VideoPostsDatasource {
  final Dio _dio = Dio();

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    final response = await _dio.get(
      'https://api.pexels.com/videos/search?query=vertical',
      queryParameters: {
        'page': page,
        'per_page': 80,
        'query': 'vertical',
      },
      options: Options(headers: {
        'Authorization':
            'oXNFeaXVOLZY6Yqq84n6UYeFbL6WDLD3CiGVa8nZVMjjRc7Il9y4iVEP'
      }),
    );

    final postsVideos = RemoteVideoModel.fromJson(response.data)
        .videos
        .map((e) => e.toVideoPostEntity())
        .toList();

    return postsVideos;
  }
}
