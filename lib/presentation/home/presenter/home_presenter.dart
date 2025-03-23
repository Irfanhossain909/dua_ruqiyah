

import '../../../core/base/base_presenter.dart';
import '../../../core/di/service_locator.dart';
import 'home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  HomePresenter() : super(const HomeUiState());

  /// হোমপেইজের বটম নেভিগেশন আইটেম সিলেক্ট করার ফাংশন
  void onBottomNavItemSelected(int index) {
    final currentState = uiState.value;
    uiState.value = currentState.copyWith(selectedIndex: index);
  }

}

/// হোম প্রেজেন্টার লোড করার হেলপার ফাংশন, সার্ভিস লোকেটর থেকে
HomePresenter loadHomePresenter() {
  return locator<HomePresenter>();
} 