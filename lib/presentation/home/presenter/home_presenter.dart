import '../../../core/base/base_presenter.dart';
import '../../../core/di/service_locator.dart';
import 'home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  HomePresenter() : super(const HomeUiState());

  // Removing the bottom navigation-related method
}

/// হোম প্রেজেন্টার লোড করার হেলপার ফাংশন, সার্ভিস লোকেটর থেকে
HomePresenter loadHomePresenter() {
  return locator<HomePresenter>();
}
