import '../../../core/base/base_presenter.dart';
import '../../../core/di/service_locator.dart';
import 'bookmark_ui_state.dart';

class BookmarkPresenter extends BasePresenter<BookmarkUiState> {
  BookmarkPresenter() : super(const BookmarkUiState());

  // Sample data for UI demo - in a real app, this would be fetched from a repository
  final List<BookmarkModel> bookmarks = [
    BookmarkModel(
      id: '1',
      name: 'Bookmark Name',
      totalDuas: 12,
      iconColor: 0xFF8A95FF, // Light blue
    ),
    BookmarkModel(
      id: '2',
      name: 'Bookmark Name',
      totalDuas: 12,
      iconColor: 0xFFFFC089, // Light orange
    ),
    BookmarkModel(
      id: '3',
      name: 'Bookmark Name',
      totalDuas: 12,
      iconColor: 0xFF8A95FF, // Light blue
    ),
    BookmarkModel(
      id: '4',
      name: 'Bookmark Name',
      totalDuas: 12,
      iconColor: 0xFFFC8D8D, // Light red
    ),
    BookmarkModel(
      id: '5',
      name: 'Bookmark Name',
      totalDuas: 12,
      iconColor: 0xFFB9E28C, // Light green
    ),
    BookmarkModel(
      id: '6',
      name: 'Bookmark Name',
      totalDuas: 12,
      iconColor: 0xFF8A95FF, // Light blue
    ),
  ];

  /// Load the bookmarks
  void loadBookmarks() {
    // In a real app, this would fetch data from a repository
    // For this demo, we're using the sample data declared above
  }

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }
}

/// Bookmark model class
class BookmarkModel {
  final String id;
  final String name;
  final int totalDuas;
  final int iconColor;

  BookmarkModel({
    required this.id,
    required this.name,
    required this.totalDuas,
    required this.iconColor,
  });
}

/// Helper function to load the bookmark presenter from the service locator
BookmarkPresenter loadBookmarkPresenter() {
  return locator<BookmarkPresenter>();
}
