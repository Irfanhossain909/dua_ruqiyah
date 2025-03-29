import 'package:flutter/material.dart';
import '../../../core/base/base_ui_state.dart';

class BookSectionUiState extends BaseUiState {
  final TextStyle titleStyle;
  final TextStyle searchHintStyle;
  final TextStyle tabTitleStyle;
  final TextStyle bookTitleStyle;
  final TextStyle bookSourceStyle;
  final TextStyle seeAllStyle;
  final TextStyle categoryTitleStyle;

  const BookSectionUiState({
    super.isLoading = false,
    super.userMessage,
    this.titleStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.searchHintStyle = const TextStyle(fontSize: 14, color: Colors.grey),
    this.tabTitleStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    this.bookTitleStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    this.bookSourceStyle = const TextStyle(fontSize: 11, color: Colors.grey),
    this.seeAllStyle = const TextStyle(
      fontSize: 12,
      color: Colors.green,
      fontWeight: FontWeight.w500,
    ),
    this.categoryTitleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  });

  BookSectionUiState copyWith({
    bool? isLoading,
    String? userMessage,
    TextStyle? titleStyle,
    TextStyle? searchHintStyle,
    TextStyle? tabTitleStyle,
    TextStyle? bookTitleStyle,
    TextStyle? bookSourceStyle,
    TextStyle? seeAllStyle,
    TextStyle? categoryTitleStyle,
  }) {
    return BookSectionUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      titleStyle: titleStyle ?? this.titleStyle,
      searchHintStyle: searchHintStyle ?? this.searchHintStyle,
      tabTitleStyle: tabTitleStyle ?? this.tabTitleStyle,
      bookTitleStyle: bookTitleStyle ?? this.bookTitleStyle,
      bookSourceStyle: bookSourceStyle ?? this.bookSourceStyle,
      seeAllStyle: seeAllStyle ?? this.seeAllStyle,
      categoryTitleStyle: categoryTitleStyle ?? this.categoryTitleStyle,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    titleStyle,
    searchHintStyle,
    tabTitleStyle,
    bookTitleStyle,
    bookSourceStyle,
    seeAllStyle,
    categoryTitleStyle,
  ];
}
