import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presenter/bookmark_presenter.dart';
import '../presenter/bookmark_ui_state.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = loadBookmarkPresenter();

    return GetX<BookmarkPresenter>(
      init: presenter,
      builder: (controller) {
        final state = controller.uiState.value;
        final bookmarks = controller.bookmarks;

        return Scaffold(
          backgroundColor: const Color(0xFFF5F8F5),
          appBar: _buildAppBar(state),
          body: _buildBody(state, bookmarks),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BookmarkUiState state) {
    return AppBar(
      backgroundColor: const Color(0xFFF5F8F5),
      elevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF457363).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.bookmark_border,
              color: Color(0xFF457363),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Text('Bookmark', style: state.titleStyle),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.bookmark_outline, color: Color(0xFF457363)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF457363),
            size: 18,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody(BookmarkUiState state, List<BookmarkModel> bookmarks) {
    return Column(
      children: [
        _buildSearchBar(state),
        Expanded(
          child:
              bookmarks.isEmpty
                  ? Center(
                    child: Text(
                      'No bookmarks available',
                      style: state.subtitleStyle,
                    ),
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: bookmarks.length,
                    itemBuilder: (context, index) {
                      final bookmark = bookmarks[index];
                      return _buildBookmarkCard(state, bookmark);
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BookmarkUiState state) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by name',
          hintStyle: state.searchHintStyle,
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildBookmarkCard(BookmarkUiState state, BookmarkModel bookmark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bookmark icon with colored background
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(bookmark.iconColor).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.bookmark,
              color: Color(bookmark.iconColor),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Bookmark details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bookmark.name, style: state.bookmarkNameStyle),
                const SizedBox(height: 4),
                Text(
                  'Total ${bookmark.totalDuas} Duas',
                  style: state.bookmarkCountStyle,
                ),
              ],
            ),
          ),
          // More options icon
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF9E9E9E)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
