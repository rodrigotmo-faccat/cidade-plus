import '../view/home_view.dart';

class HomePresenter {
  final HomeViewContract view;

  HomePresenter(this.view);

  void sair() {
    view.sair();
  }
}
