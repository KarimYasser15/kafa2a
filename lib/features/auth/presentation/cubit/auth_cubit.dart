import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/auth/data/models/log_out_response.dart';
import 'package:kafa2a/features/auth/data/models/login_request.dart';
import 'package:kafa2a/features/auth/data/models/register_provider_request.dart';
import 'package:kafa2a/features/auth/data/models/register_user_request.dart';
import 'package:kafa2a/features/auth/domain/entities/provider.dart';
import 'package:kafa2a/features/auth/domain/entities/user.dart';
import 'package:kafa2a/features/auth/domain/use_cases/log_out.dart';
import 'package:kafa2a/features/auth/domain/use_cases/login_provider.dart';
import 'package:kafa2a/features/auth/domain/use_cases/login_user.dart';
import 'package:kafa2a/features/auth/domain/use_cases/register_provider.dart';
import 'package:kafa2a/features/auth/domain/use_cases/register_user.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._loginUser, this._loginProvider, this._registerUser,
      this._registerProvider, this._logOut)
      : super(AuthInitialState());

  final LoginUser _loginUser;
  final LoginProvider _loginProvider;
  final RegisterUser _registerUser;
  final RegisterProvider _registerProvider;
  final LogOut _logOut;

  late File cameraImage;
  late File image;

  Future<void> loginUser(LoginRequest loginRequest) async {
    emit(
      AuthLoadingState(),
    );
    final Either<User, Failure> response = await _loginUser(loginRequest);
    response.fold(
      (_) => emit(
        AuthSuccessState(),
      ),
      (failure) => emit(
        AuthErrorState(failure.message),
      ),
    );
  }

  Future<void> loginProvider(LoginRequest loginRequest) async {
    emit(
      AuthLoadingState(),
    );
    final Either<Provider, Failure> response =
        await _loginProvider(loginRequest);
    response.fold(
      (_) => emit(
        AuthSuccessState(),
      ),
      (failure) => emit(
        AuthErrorState(failure.message),
      ),
    );
  }

  Future<void> registerUser(RegisterUserRequest registerUserRequest) async {
    emit(
      AuthLoadingState(),
    );
    final Either<User, Failure> response =
        await _registerUser(registerUserRequest);
    response.fold(
      (_) => emit(
        AuthSuccessState(),
      ),
      (failure) => emit(
        AuthErrorState(failure.message),
      ),
    );
  }

  Future<void> registerProvider(
      RegisterProviderRequest registerProviderRequest) async {
    emit(
      AuthLoadingState(),
    );
    final Either<Provider, Failure> response =
        await _registerProvider(registerProviderRequest);
    response.fold(
      (_) => emit(
        AuthSuccessState(),
      ),
      (failure) => emit(
        AuthErrorState(failure.message),
      ),
    );
  }

  Future<void> logOut() async {
    emit(
      AuthLoadingState(),
    );
    final Either<LogOutResponse, Failure> response = await _logOut();
    response.fold(
      (_) => emit(
        AuthSuccessState(),
      ),
      (failure) => emit(
        AuthErrorState(failure.message),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(
      image.path,
    );
    this.image = imageTemp;
  }

  Future pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (image == null) return;
    final imageTemp = File(
      image.path,
    );
    cameraImage = imageTemp;
  }
}
