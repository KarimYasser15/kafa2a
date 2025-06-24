// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:kafa2a/core/di/register_module.dart' as _i213;
import 'package:kafa2a/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i819;
import 'package:kafa2a/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:kafa2a/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i386;
import 'package:kafa2a/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i755;
import 'package:kafa2a/features/auth/data/repository/auth_repository_impl.dart'
    as _i887;
import 'package:kafa2a/features/auth/domain/repository/auth_repository.dart'
    as _i998;
import 'package:kafa2a/features/auth/domain/use_cases/log_out.dart' as _i23;
import 'package:kafa2a/features/auth/domain/use_cases/login_provider.dart'
    as _i160;
import 'package:kafa2a/features/auth/domain/use_cases/login_user.dart' as _i684;
import 'package:kafa2a/features/auth/domain/use_cases/register_provider.dart'
    as _i619;
import 'package:kafa2a/features/auth/domain/use_cases/register_user.dart'
    as _i0;
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart'
    as _i290;
import 'package:kafa2a/features/home/provider/data/data_source/provider_offers_api_data_source.dart'
    as _i0;
import 'package:kafa2a/features/home/provider/data/data_source/provider_offers_remote_data_source.dart'
    as _i633;
import 'package:kafa2a/features/home/provider/data/repository/provider_offers_repository.dart'
    as _i723;
import 'package:kafa2a/features/home/provider/presentation/cubit/provider_offers_cubit.dart'
    as _i42;
import 'package:kafa2a/features/home/user/data/data_sources/request_service_api_data_source.dart'
    as _i195;
import 'package:kafa2a/features/home/user/data/data_sources/request_service_remote_data_source.dart'
    as _i519;
import 'package:kafa2a/features/home/user/data/repository/request_service_repository.dart'
    as _i110;
import 'package:kafa2a/features/home/user/presentation/cubit/request_service_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i755.AuthRemoteDataSource>(
        () => _i386.AuthApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i819.AuthLocalDataSource>(
        () => AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.singleton<_i998.AuthRepository>(() => _i887.AuthRepositoryImpl(
          gh<_i755.AuthRemoteDataSource>(),
          gh<_i819.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i633.ProviderOffersRemoteDataSource>(
        () => _i0.ProviderOffersApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i519.RequestServiceRemoteDataSource>(
        () => _i195.RequestServiceApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i723.ProviderOffersRepository>(
        () => _i723.ProviderOffersRepository(
              gh<_i633.ProviderOffersRemoteDataSource>(),
              gh<_i819.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i110.RequestServiceRepository>(
        () => _i110.RequestServiceRepository(
              gh<_i519.RequestServiceRemoteDataSource>(),
              gh<_i819.AuthLocalDataSource>(),
            ));
    gh.factory<RequestServiceCubit>(
        () => RequestServiceCubit(gh<_i110.RequestServiceRepository>()));
    gh.singleton<_i160.LoginProvider>(
        () => _i160.LoginProvider(gh<_i998.AuthRepository>()));
    gh.singleton<_i684.LoginUser>(
        () => _i684.LoginUser(gh<_i998.AuthRepository>()));
    gh.singleton<_i23.LogOut>(() => _i23.LogOut(gh<_i998.AuthRepository>()));
    gh.singleton<_i619.RegisterProvider>(
        () => _i619.RegisterProvider(gh<_i998.AuthRepository>()));
    gh.singleton<_i0.RegisterUser>(
        () => _i0.RegisterUser(gh<_i998.AuthRepository>()));
    gh.lazySingleton<_i42.ProviderOffersCubit>(
        () => _i42.ProviderOffersCubit(gh<_i723.ProviderOffersRepository>()));
    gh.singleton<_i290.AuthCubit>(() => _i290.AuthCubit(
          gh<_i684.LoginUser>(),
          gh<_i160.LoginProvider>(),
          gh<_i0.RegisterUser>(),
          gh<_i619.RegisterProvider>(),
          gh<_i23.LogOut>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i213.RegisterModule {}
