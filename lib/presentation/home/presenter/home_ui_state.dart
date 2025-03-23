
import 'package:flutter/material.dart';
import '../../../core/base/base_ui_state.dart';

class HomeUiState extends BaseUiState {
  final int selectedIndex;
  final TextStyle timeTextStyle;
  final TextStyle smallTimeTextStyle;
  final TextStyle prayerNameTextStyle;
  final TextStyle remainingTimeTextStyle;
  final TextStyle smallCardTitleStyle;
  final TextStyle smallCardTimeStyle;
  final TextStyle duaTitleStyle;
  final TextStyle duaSubtitleStyle;
  final TextStyle duaCountStyle;
  final TextStyle duaCountLabelStyle;
  final TextStyle sectionTitleStyle;
  final TextStyle locationTextStyle;
  final TextStyle tabTextStyle;

  const HomeUiState({
    super.isLoading = false,
    super.userMessage,
    this.selectedIndex = 0,
    this.timeTextStyle = const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    this.smallTimeTextStyle = const TextStyle(fontSize: 12, color: Colors.grey),
    this.prayerNameTextStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
    this.remainingTimeTextStyle = const TextStyle(fontSize: 10, color: Color(0xFF757575)),
    this.smallCardTitleStyle = const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
    this.smallCardTimeStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    this.duaTitleStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    this.duaSubtitleStyle = const TextStyle(fontSize: 10, color: Color(0xFF9E9E9E)),
    this.duaCountStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    this.duaCountLabelStyle = const TextStyle(fontSize: 10, color: Color(0xFF9E9E9E)),
    this.sectionTitleStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.locationTextStyle = const TextStyle(fontSize: 12),
    this.tabTextStyle = const TextStyle(fontWeight: FontWeight.w500),
  });

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    int? selectedIndex,
    TextStyle? timeTextStyle,
    TextStyle? smallTimeTextStyle,
    TextStyle? prayerNameTextStyle,
    TextStyle? remainingTimeTextStyle,
    TextStyle? smallCardTitleStyle,
    TextStyle? smallCardTimeStyle,
    TextStyle? duaTitleStyle,
    TextStyle? duaSubtitleStyle,
    TextStyle? duaCountStyle,
    TextStyle? duaCountLabelStyle,
    TextStyle? sectionTitleStyle,
    TextStyle? locationTextStyle,
    TextStyle? tabTextStyle,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      timeTextStyle: timeTextStyle ?? this.timeTextStyle,
      smallTimeTextStyle: smallTimeTextStyle ?? this.smallTimeTextStyle,
      prayerNameTextStyle: prayerNameTextStyle ?? this.prayerNameTextStyle,
      remainingTimeTextStyle: remainingTimeTextStyle ?? this.remainingTimeTextStyle,
      smallCardTitleStyle: smallCardTitleStyle ?? this.smallCardTitleStyle,
      smallCardTimeStyle: smallCardTimeStyle ?? this.smallCardTimeStyle,
      duaTitleStyle: duaTitleStyle ?? this.duaTitleStyle,
      duaSubtitleStyle: duaSubtitleStyle ?? this.duaSubtitleStyle,
      duaCountStyle: duaCountStyle ?? this.duaCountStyle,
      duaCountLabelStyle: duaCountLabelStyle ?? this.duaCountLabelStyle,
      sectionTitleStyle: sectionTitleStyle ?? this.sectionTitleStyle,
      locationTextStyle: locationTextStyle ?? this.locationTextStyle,
      tabTextStyle: tabTextStyle ?? this.tabTextStyle,
    );
  }
  
  @override
  List<Object?> get props => [
    ...super.props,
    selectedIndex,
    timeTextStyle,
    smallTimeTextStyle,
    prayerNameTextStyle,
    remainingTimeTextStyle,
    smallCardTitleStyle,
    smallCardTimeStyle,
    duaTitleStyle,
    duaSubtitleStyle,
    duaCountStyle,
    duaCountLabelStyle,
    sectionTitleStyle,
    locationTextStyle,
    tabTextStyle,
  ];
} 