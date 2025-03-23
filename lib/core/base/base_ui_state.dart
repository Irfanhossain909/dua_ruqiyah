import 'package:equatable/equatable.dart';

/// BaseUiState is an abstract class for UI state, containing common state properties
/// 
/// All UI state classes should extend this class
abstract class BaseUiState extends Equatable {
  /// Indicates whether a loading operation is in progress
  final bool isLoading;
  
  /// Optional message to display to the user (error or informational)
  final String? userMessage;

  const BaseUiState({
    this.isLoading = false,
    this.userMessage,
  });

  @override
  List<Object?> get props => [isLoading, userMessage];
} 