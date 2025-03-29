import 'package:flutter/material.dart';
import '../../../core/base/base_ui_state.dart';

class AllDuaUiState extends BaseUiState {
  final TextStyle titleStyle;
  final TextStyle searchHintStyle;
  final TextStyle itemTitleStyle;
  final TextStyle itemNumberStyle;
  final TextStyle sortingTitleStyle;
  final TextStyle alphabetStyle;

  const AllDuaUiState({
    super.isLoading = false,
    super.userMessage,
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    this.searchHintStyle = const TextStyle(
      color: Color(0xFF9E9E9E),
      fontSize: 16,
    ),
    this.itemTitleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    this.itemNumberStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color(0xFF457363),
    ),
    this.sortingTitleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    this.alphabetStyle = const TextStyle(
      fontSize: 12,
      color: Color(0xFF9E9E9E),
    ),
  });

  AllDuaUiState copyWith({
    bool? isLoading,
    String? userMessage,
    TextStyle? titleStyle,
    TextStyle? searchHintStyle,
    TextStyle? itemTitleStyle,
    TextStyle? itemNumberStyle,
    TextStyle? sortingTitleStyle,
    TextStyle? alphabetStyle,
  }) {
    return AllDuaUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      titleStyle: titleStyle ?? this.titleStyle,
      searchHintStyle: searchHintStyle ?? this.searchHintStyle,
      itemTitleStyle: itemTitleStyle ?? this.itemTitleStyle,
      itemNumberStyle: itemNumberStyle ?? this.itemNumberStyle,
      sortingTitleStyle: sortingTitleStyle ?? this.sortingTitleStyle,
      alphabetStyle: alphabetStyle ?? this.alphabetStyle,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    titleStyle,
    searchHintStyle,
    itemTitleStyle,
    itemNumberStyle,
    sortingTitleStyle,
    alphabetStyle,
  ];
}
