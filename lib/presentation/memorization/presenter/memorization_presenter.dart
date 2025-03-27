
import 'package:equatable/equatable.dart';
import '../../../core/base/base_presenter.dart';
import '../../../core/base/base_ui_state.dart';

/// Memorization UI State class
class MemorizationUiState extends BaseUiState {
  final List<MemorizationPlanModel> plans;

  const MemorizationUiState({
    super.isLoading = false,
    super.userMessage,
    this.plans = const [],
  });

  @override
  List<Object?> get props => [...super.props, plans];

  MemorizationUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<MemorizationPlanModel>? plans,
  }) {
    return MemorizationUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      plans: plans ?? this.plans,
    );
  }
}

/// Memorization presenter for handling business logic
class MemorizationPresenter extends BasePresenter<MemorizationUiState> {
  MemorizationPresenter() : super(const MemorizationUiState());

  @override
  void onInit() {
    super.onInit();
    _loadMemorizationPlans();
  }

  /// Load memorization plans from storage or API
  Future<void> _loadMemorizationPlans() async {
    await executeTaskWithLoading(() async {
      // Mock data for demonstration
      final mockPlans = [
        MemorizationPlanModel(
          id: '1',
          title: 'My 50 Day Plan',
          daysLeft: 21,
          daysRemaining: 8,
          progress: 0.75, // 75%
          completedItems: 1,
          totalItems: 3,
          isActive: false,
          endDate: DateTime(2025, 1, 14),
        ),
        MemorizationPlanModel(
          id: '2',
          title: 'My 50 Day Plan',
          daysLeft: 21,
          daysRemaining: 8,
          progress: 0.75, // 75%
          completedItems: 1,
          totalItems: 3,
          isActive: false,
          endDate: DateTime(2025, 1, 14),
        ),
      ];

      _updatePlans(mockPlans);
    });
  }

  /// Toggle plan active status
  void togglePlanStatus(String planId, bool isActive) {
    final currentPlans = uiState.value.plans;
    final updatedPlans =
        currentPlans.map((plan) {
          if (plan.id == planId) {
            return plan.copyWith(isActive: isActive);
          }
          return plan;
        }).toList();

    _updatePlans(updatedPlans);
  }

  /// Create a new memorization plan
  Future<void> createNewPlan() async {
    // Implementation for creating a new plan
    // This would be connected to a domain use case in a full implementation
  }

  /// Update plans in state
  void _updatePlans(List<MemorizationPlanModel> plans) {
    final currentState = uiState.value;
    uiState.value = currentState.copyWith(plans: plans);
  }

}

/// Model class for memorization plan
class MemorizationPlanModel extends Equatable {
  final String id;
  final String title;
  final int daysLeft;
  final int daysRemaining;
  final double progress;
  final int completedItems;
  final int totalItems;
  final bool isActive;
  final DateTime endDate;

  const MemorizationPlanModel({
    required this.id,
    required this.title,
    required this.daysLeft,
    required this.daysRemaining,
    required this.progress,
    required this.completedItems,
    required this.totalItems,
    required this.isActive,
    required this.endDate,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    daysLeft,
    daysRemaining,
    progress,
    completedItems,
    totalItems,
    isActive,
    endDate,
  ];

  MemorizationPlanModel copyWith({
    String? id,
    String? title,
    int? daysLeft,
    int? daysRemaining,
    double? progress,
    int? completedItems,
    int? totalItems,
    bool? isActive,
    DateTime? endDate,
  }) {
    return MemorizationPlanModel(
      id: id ?? this.id,
      title: title ?? this.title,
      daysLeft: daysLeft ?? this.daysLeft,
      daysRemaining: daysRemaining ?? this.daysRemaining,
      progress: progress ?? this.progress,
      completedItems: completedItems ?? this.completedItems,
      totalItems: totalItems ?? this.totalItems,
      isActive: isActive ?? this.isActive,
      endDate: endDate ?? this.endDate,
    );
  }
}
