import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/exceptions.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:kafa2a/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:kafa2a/features/auth/data/models/log_out_response.dart';
import 'package:kafa2a/features/auth/data/models/login_request.dart';
import 'package:kafa2a/features/auth/data/models/register_provider_request.dart';
import 'package:kafa2a/features/auth/data/models/auth_response.dart';
import 'package:kafa2a/features/auth/data/models/register_user_request.dart';
import 'package:kafa2a/features/auth/data/models/user_model.dart';

@singleton
class AuthRepository {
  AuthRepository(
    this._authRemoteDataSource,
    this._authLocalDataSource,
  );

  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;

  Future<Either<UserModel, Failure>> registerUser(
      RegisterUserRequest registerUserRequest) async {
    try {
      final AuthResponse response =
          await _authRemoteDataSource.registerUser(registerUserRequest);
      _authLocalDataSource.saveToken(response.token!);
      return Left(response.user!);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }

  Future<Either<UserModel, Failure>> registerProvider(
      RegisterProviderRequest registerProviderRequest) async {
    try {
      final AuthResponse response =
          await _authRemoteDataSource.registerProvider(registerProviderRequest);
      _authLocalDataSource.saveToken(response.token!);
      return Left(response.user!);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }

  Future<Either<UserModel, Failure>> loginUser(
      LoginRequest loginRequest) async {
    try {
      final response = await _authRemoteDataSource.loginUser(loginRequest);
      _authLocalDataSource.saveToken(response.token!);
      return Left(response.user!);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }

  Future<Either<UserModel, Failure>> loginProvider(
      LoginRequest loginRequest) async {
    try {
      final response = await _authRemoteDataSource.loginProvider(loginRequest);
      _authLocalDataSource.saveToken(response.token!);
      return Left(response.user!);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }

  Future<Either<LogOutResponse, Failure>> logOut() async {
    try {
      final String token = _authLocalDataSource.getToken();
      final LogOutResponse response = await _authRemoteDataSource.logOut(token);
      _authLocalDataSource.removeToken();
      return Left(response);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }
}
