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
import 'package:kafa2a/features/auth/data/models/user_model.dart';
import 'package:kafa2a/features/auth/data/repository/auth_repository.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._authRepository) : super(AuthInitialState());

  late File cameraImage;
  late File image;

  final AuthRepository _authRepository;

  Future<void> loginUser(LoginRequest loginRequest) async {
    emit(
      AuthLoadingState(),
    );
    final Either<UserModel, Failure> response =
        await _authRepository.loginUser(loginRequest);
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
    final Either<UserModel, Failure> response =
        await _authRepository.loginProvider(loginRequest);
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
    final Either<UserModel, Failure> response =
        await _authRepository.registerUser(registerUserRequest);
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
    final Either<UserModel, Failure> response =
        await _authRepository.registerProvider(registerProviderRequest);
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
    final Either<LogOutResponse, Failure> response =
        await _authRepository.logOut();
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
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;
    final imageTemp = File(
      image.path,
    );
    this.image = imageTemp;
  }

  Future pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image == null) return;
    final imageTemp = File(
      image.path,
    );
    cameraImage = imageTemp;
  }
}
