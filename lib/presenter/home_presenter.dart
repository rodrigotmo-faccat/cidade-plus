import '../view/home_view.dart';

class HomePresenter {
  final HomeView view;

  HomePresenter(this.view);

  void sair() {
    view.sair();
  }
}
