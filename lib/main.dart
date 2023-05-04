import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toktik_app/config/theme/app_theme.dart';
import 'package:toktik_app/infrastructure/datasources/remote_videos_datasource_impl.dart';
import 'package:toktik_app/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik_app/presentation/providers/providers.dart';
import 'package:toktik_app/presentation/screens/discover/discover_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: RemoteVideosDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        home: const DiscoverScreen(),
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
