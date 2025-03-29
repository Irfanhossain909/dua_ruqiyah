import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presenter/booksection_presenter.dart';
import '../presenter/booksection_ui_state.dart';

class BookSectionScreen extends StatelessWidget {
  const BookSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = loadBookSectionPresenter();

    return GetX<BookSectionPresenter>(
      init: presenter,
      builder: (controller) {
        final state = controller.uiState.value;

        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Books', style: state.titleStyle),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search by Books Name',
                        hintStyle: state.searchHintStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // Category Tabs
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryTab(
                          'All',
                          Icons.book,
                          Colors.grey,
                          state,
                        ),
                        _buildCategoryTab(
                          'Dua',
                          Icons.book,
                          Colors.orange,
                          state,
                        ),
                        _buildCategoryTab(
                          'Ruqyah',
                          Icons.book,
                          Colors.green,
                          state,
                        ),
                        _buildCategoryTab(
                          'Azkar',
                          Icons.book,
                          Colors.purple,
                          state,
                        ),
                      ],
                    ),
                  ),
                ),

                // Popular Books Section
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      // Popular Books Header
                      _buildSectionHeader('Popular Books', state),

                      // Popular Books Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                        children: List.generate(4, (index) {
                          return _buildBookItem(
                            'Eleven Ways to Perform Ruqyah',
                            'Collected From Internet',
                            state,
                          );
                        }),
                      ),

                      // Dua Books Header
                      _buildSectionHeader('Dua Books', state),

                      // Dua Books Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                        children: List.generate(4, (index) {
                          return _buildBookItem(
                            'Eleven Ways to Perform Ruqyah',
                            'Collected From Internet',
                            state,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryTab(
    String title,
    IconData icon,
    Color color,
    BookSectionUiState state,
  ) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 4),
          Text(title, style: state.tabTitleStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, BookSectionUiState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: state.categoryTitleStyle),
          Text('See All', style: state.seeAllStyle),
        ],
      ),
    );
  }

  Widget _buildBookItem(String title, String source, BookSectionUiState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book cover image
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
              // Placeholder color gradient instead of an image that might not exist
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[100]!, Colors.blue[200]!],
              ),
            ),
            child: Center(
              child: Icon(Icons.menu_book, size: 40, color: Colors.blue[800]),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: state.bookTitleStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(source, style: state.bookSourceStyle),
      ],
    );
  }
}
