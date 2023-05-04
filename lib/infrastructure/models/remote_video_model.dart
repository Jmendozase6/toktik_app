// import 'dart:convert';

// List<RemoteVideoModel> remoteVideoModelFromJson(String videoList) =>
//     List<RemoteVideoModel>.from(
//         json.decode(videoList).map((x) => RemoteVideoModel.fromJson(x)));

import 'package:toktik_app/domain/entities/video_post.dart';

class RemoteVideoModel {
  RemoteVideoModel({
    required this.page,
    required this.perPage,
    required this.videos,
    required this.totalResults,
    required this.nextPage,
    required this.url,
  });

  final int page;
  final int perPage;
  final List<Video> videos;
  final int totalResults;
  final String nextPage;
  final String url;

  factory RemoteVideoModel.fromJson(Map<String, dynamic> json) =>
      RemoteVideoModel(
        page: json["page"],
        perPage: json["per_page"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        url: json["url"],
      );
}

class Video {
  Video({
    required this.id,
    required this.width,
    required this.height,
    required this.duration,
    this.fullRes,
    required this.tags,
    required this.url,
    required this.image,
    this.avgColor,
    required this.user,
    required this.videoFiles,
  });

  final int id;
  final int width;
  final int height;
  final int duration;
  final dynamic fullRes;
  final List<dynamic> tags;
  final String url;
  final String image;
  final dynamic avgColor;
  final User user;
  final List<VideoFile> videoFiles;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        duration: json["duration"],
        fullRes: json["full_res"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        url: json["url"],
        image: json["image"],
        avgColor: json["avg_color"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((x) => VideoFile.fromJson(x))),
      );

  VideoPost toVideoPostEntity() => VideoPost(
        caption: user.name,
        videoUrl: videoFiles.first.link,
        likes: videoFiles.first.height,
        views: videoFiles.first.width,
      );
}

class User {
  User({
    required this.name,
  });

  final String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
      );
}

class VideoFile {
  VideoFile({
    required this.id,
    required this.width,
    required this.height,
    this.fps,
    required this.link,
  });

  final int id;
  final int width;
  final int height;
  final double? fps;
  final String link;

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        fps: json["fps"]?.toDouble(),
        link: json["link"],
      );
}
