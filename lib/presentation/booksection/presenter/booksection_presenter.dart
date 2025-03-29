import '../../../core/base/base_presenter.dart';
import '../../../core/di/service_locator.dart';
import 'booksection_ui_state.dart';

class BookSectionPresenter extends BasePresenter<BookSectionUiState> {
  BookSectionPresenter() : super(const BookSectionUiState());

  // Add any book section specific methods here
}

/// Book section presenter loader helper function from service locator
BookSectionPresenter loadBookSectionPresenter() {
  return locator<BookSectionPresenter>();
}
