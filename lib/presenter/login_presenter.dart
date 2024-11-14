import '../view/login_view.dart';

class LoginPresenter {
  final LoginViewContract view;

  LoginPresenter(this.view);

  void login(String username, String password) {
    // Simulação de verificação de login
    if (username == 'admin' && password == 'admin') {
      view.onLoginSuccess();
    } else {
      view.onLoginError("Usuário/senha inválidos.");
    }
  }
}
