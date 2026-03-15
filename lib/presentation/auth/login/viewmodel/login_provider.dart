import 'package:auth/core/network/api_clients.dart';
import 'package:auth/data/repositories/auth/auth_repository.dart';
import 'package:auth/data/sources/remote/auth/auth_remote_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/resources/constant/validator.dart';
import '../../../../../data/models/response_model.dart';

final loginProvider = NotifierProvider.autoDispose<LoginNotifier, LoginState>(
  LoginNotifier.new,
);

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState(isLoading: false, isPasswordVisible: true);
  }

  AuthRepository repository = AuthRepository(
    remoteServices: AuthRemoteService(apiClient: ApiClient()),
  );

  bool validation({required String email, required String password}) {
    final eErr = ValidationManager.validateEmail(email);
    final psErr = ValidationManager.validatePassword(password);

    state = state.copyWith(
      emailError: eErr,
      passError: psErr,
      isFormValid: eErr == null && psErr == null,
    );

    return state.isFormValid;
  }

  // password toggle
  void isPasswordVisible() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  // login
  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);
    final result = await repository.logIn(email: email, password: password);
    state = state.copyWith(isLoading: false);
    return result;
  }
}

class LoginState {
  final bool isLoading;
  final bool isPasswordVisible;
  final bool isFormValid;
  final String? emailError;
  final String? passError;

  LoginState({
    required this.isLoading,
    required this.isPasswordVisible,
    this.isFormValid = false,
    this.emailError,
    this.passError,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    bool? isFormValid,
    String? emailError,
    String? passError,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isFormValid: isFormValid ?? this.isFormValid,
      emailError: emailError,
      passError: passError,
    );
  }
}
