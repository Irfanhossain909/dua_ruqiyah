import 'package:flutter/material.dart';
import '../../../core/base/base_ui_state.dart';

class BookmarkUiState extends BaseUiState {
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle searchHintStyle;
  final TextStyle bookmarkNameStyle;
  final TextStyle bookmarkCountStyle;

  const BookmarkUiState({
    super.isLoading = false,
    super.userMessage,
    this.titleStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    this.subtitleStyle = const TextStyle(
      fontSize: 12,
      color: Color(0xFF757575),
    ),
    this.searchHintStyle = const TextStyle(
      color: Color(0xFF9E9E9E),
      fontSize: 16,
    ),
    this.bookmarkNameStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.bookmarkCountStyle = const TextStyle(
      fontSize: 12,
      color: Color(0xFF9E9E9E),
    ),
  });

  BookmarkUiState copyWith({
    bool? isLoading,
    String? userMessage,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? searchHintStyle,
    TextStyle? bookmarkNameStyle,
    TextStyle? bookmarkCountStyle,
  }) {
    return BookmarkUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      searchHintStyle: searchHintStyle ?? this.searchHintStyle,
      bookmarkNameStyle: bookmarkNameStyle ?? this.bookmarkNameStyle,
      bookmarkCountStyle: bookmarkCountStyle ?? this.bookmarkCountStyle,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    titleStyle,
    subtitleStyle,
    searchHintStyle,
    bookmarkNameStyle,
    bookmarkCountStyle,
  ];
}
