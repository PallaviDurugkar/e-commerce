import 'package:e_commerce_project/provider/loading_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = ChangeNotifierProvider(
  (ref) => AuthViewModel(ref.read),
);

class AuthViewModel extends ChangeNotifier {
  final Reader _reader;
  AuthViewModel(this._reader);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool obscureText) {
    _obscurePassword = obscureText;
    notifyListeners();
  }

  bool _obscureConfirmPassword = true;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  set obscureConfirmPassword(bool obscureConfirmPassword) {
    _obscureConfirmPassword = obscureConfirmPassword;
    notifyListeners();
  }

  String? emailValidate(String value) {
    const String formate =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    return !RegExp(formate).hasMatch(value) ? "Enter valid Email" : null;
  }

  Loading get _loading => _reader(loadingProvider);

  Future<void> login() async {
    _loading.start();
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loading.end();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      _loading.stop();

      if (e.code == "wrong-password") {
        return Future.error("Wrong-Password! Please enter correct password.");
      } else if (e.code == "user-not-found") {
        return Future.error("User not found!");
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      _loading.stop();

      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> register() async {
    _loading.start();
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      sendEmail();
      _loading.end();
    } on FirebaseAuthException catch (e) {
      _loading.stop();

      if (e.code == "weak-password") {
        return Future.error("Weak-Password! Please enter strong password. ");
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      _loading.stop();

      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> reload() async {
    await _auth.currentUser!.reload();
    notifyListeners();
  }

  Future<void> sendEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void streamCheck({required VoidCallback onDone}) {
    final stream = Stream.periodic(const Duration(seconds: 2), (t) => t);
    stream.listen((_) async {
      await reload();
      if (_auth.currentUser!.emailVerified) {
        onDone();
      }
    });
  }
}
