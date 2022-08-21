import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/features/album_photos/domain/usecases/get_album_photos.dart';
import 'package:test_for_eclipse/features/album_photos/presentation/bloc/albums_photos_bloc.dart';
import 'package:test_for_eclipse/features/user_albums/presentation/bloc/user_albums_bloc.dart';

import 'core/network/network.dart';
import 'features/album_photos/data/data_sources/album_photos_local_data_source.dart';
import 'features/album_photos/data/data_sources/album_photos_remote_data_source.dart';
import 'features/album_photos/data/repositories/album_photos_repository_impl.dart';
import 'features/album_photos/domain/repositories/album_photos_repository.dart';
import 'features/post_comments/data/data_sources/post_comments_local_data_source.dart';
import 'features/post_comments/data/data_sources/post_comments_remote_data_source.dart';
import 'features/post_comments/data/repositories/post_comments_repository_impl.dart';
import 'features/post_comments/domain/repositories/post_comments_repository.dart';
import 'features/post_comments/domain/usecases/get_post_comments.dart';
import 'features/post_comments/domain/usecases/post_post_comments.dart';
import 'features/post_comments/presentation/bloc/post_comments_bloc.dart';
import 'features/user_albums/data/data_sources/user_albums_local_data_source.dart';
import 'features/user_albums/data/data_sources/user_albums_remote_data_source.dart';
import 'features/user_albums/data/repositories/users_albums_repository_impl.dart';
import 'features/user_albums/domain/repositories/albums_list_repository.dart';
import 'features/user_albums/domain/usecases/get_user_albums.dart';
import 'features/user_posts/data/data_sources/user_posts_local_data_source.dart';
import 'features/user_posts/data/data_sources/user_posts_remote_data_source.dart';
import 'features/user_posts/data/repositories/users_posts_repository_impl.dart';
import 'features/user_posts/domain/repositories/user_posts_repository.dart';
import 'features/user_posts/domain/usecases/get_user_posts.dart';
import 'features/user_posts/presentation/bloc/user_posts_bloc.dart';
import 'features/users/data/data_sources/user_info_local_data_source.dart';
import 'features/users/data/data_sources/user_info_remote_data_source.dart';
import 'features/users/data/data_sources/users_list_local_data_source.dart';
import 'features/users/data/data_sources/users_list_remote_data_source.dart';
import 'features/users/data/repositories/user_info_repository_impl.dart';
import 'features/users/data/repositories/users_list_repository_impl.dart';
import 'features/users/domain/repositories/user_info_repository.dart';
import 'features/users/domain/repositories/users_list_repository.dart';
import 'features/users/domain/usecases/get_user_info.dart';
import 'features/users/domain/usecases/get_users_list.dart';
import 'features/users/presentation/bloc/users_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features - Users List -----
  // Bloc
  sl.registerFactory(
    () => UsersBloc(
      getUsersList: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUsersList(sl()));

  // Repository
  sl.registerLazySingleton<UsersListRepository>(
    () => UsersListRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UsersListRemoteDataSource>(
    () => UsersListRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<UsersListLocalDataSource>(
    () => UsersListLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Features - User Info -----

  // Use cases
  sl.registerLazySingleton(() => GetUserInfo(sl()));

  // Repository
  sl.registerLazySingleton<UserInfoRepository>(
    () => UserInfoRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserInfoRemoteDataSource>(
    () => UserInfoRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<UserInfoLocalDataSource>(
    () => UserInfoLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Features - User Posts -----

  // Bloc
  sl.registerFactory(
    () => UserPostsBloc(
      getUserPosts: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserPosts(sl()));

  // Repository
  sl.registerLazySingleton<UserPostsRepository>(
    () => UserPostsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserPostsRemoteDataSource>(
    () => UserPostsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<UserPostsLocalDataSource>(
    () => UserPostsLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Features - User Albums -----

  // Bloc
  sl.registerFactory(
    () => UserAlbumsBloc(
      getUserAlbums: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserAlbums(sl()));

  // Repository
  sl.registerLazySingleton<UserAlbumsRepository>(
    () => UserAlbumsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserAlbumsRemoteDataSource>(
    () => UserAlbumsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<UserAlbumsLocalDataSource>(
    () => UserAlbumsLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Features - User Albums -----

  // Bloc
  sl.registerFactory(
    () => AlbumsPhotosBloc(
      getAlbumPhotos: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAlbumPhotos(sl()));

  // Repository
  sl.registerLazySingleton<AlbumPhotosRepository>(
    () => AlbumPhotosRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AlbumPhotosRemoteDataSource>(
    () => AlbumPhotosRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<AlbumPhotosLocalDataSource>(
    () => AlbumPhotosLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Features - Post Comments -----

  // Bloc
  sl.registerFactory(
    () => PostCommentsBloc(
      getPostComment: sl(),
      postPostComment: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPostComment(sl()));
  sl.registerLazySingleton(() => PostPostComment(sl()));

  // Repository
  sl.registerLazySingleton<PostCommentsRepository>(
    () => PostCommentsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PostCommentRemoteDataSource>(
    () => PostCommentRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<PostCommentLocalDataSource>(
    () => PostCommentLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Core -----
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External -----
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
