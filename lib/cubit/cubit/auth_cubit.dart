import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<UserModel?> createUser(String email, String password) async {
  //   try {
  //     emit(AuthLoading());
  //     final UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     final User? firebaseUser = userCredential.user;
  //     if (firebaseUser != null) {
  //       return UserModel(
  //           uid: firebaseUser.uid,
  //           displayName: firebaseUser.displayName,
  //           email: firebaseUser.email);
  //     }
  //     emit(AuthSuccess(user: firebaseUser.user))
  //   } catch (e) {
  //     emit(AuthError(errorMessage: e.toString()));
  //   }
  //   return null;
  // }

  Future<void> createUser(String email, String password) async {
    try {
      emit(AuthLoading());
      final userRegister = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess(user: userRegister.user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> userLogout() async {
    try {
      emit(AuthLoading());
      final User? user = _auth.currentUser;
      if (user != null) {
        await _auth.signOut();
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> userLogin(String email, String password) async {
    try {
      emit(AuthLoading());
      final userLogin = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess(user: userLogin.user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
