import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

import 'base_ui_state.dart';

/// BasePresenter is an abstract class for Presenters
///
/// It provides methods for updating UI state, handling loading state, 
/// user messages, and use case execution
abstract class BasePresenter<U extends BaseUiState> extends GetxController {
  /// Observable UI state
  final Rx<U> uiState;

  BasePresenter(U initialState) : uiState = initialState.obs;

  /// Toggle loading state
  void toggleLoading({required bool loading}) {
    final currentState = uiState.value;
    final updatedState = _updateState(
      currentState,
      isLoading: loading,
    ) as U;
    uiState.value = updatedState;
  }

  /// Add user message
  void addUserMessage(String message) {
    final currentState = uiState.value;
    final updatedState = _updateState(
      currentState,
      userMessage: message,
    ) as U;
    uiState.value = updatedState;
  }

  /// Handle stream of Either events
  void handleStreamEvents<T>({
    required Stream<Either<String, T>> stream,
    required Function(T) onData,
    bool showLoadingOnListen = true,
    bool hideLoadingOnDone = true,
    bool showErrorMessages = true,
  }) {
    if (showLoadingOnListen) {
      toggleLoading(loading: true);
    }

    stream.listen(
      (event) {
        event.fold(
          (error) {
            if (showErrorMessages) {
              addUserMessage(error);
            }
          },
          (data) => onData(data),
        );
      },
      onDone: () {
        if (hideLoadingOnDone) {
          toggleLoading(loading: false);
        }
      },
      onError: (error) {
        toggleLoading(loading: false);
        if (showErrorMessages) {
          addUserMessage(error.toString());
        }
      },
    );
  }

  /// Execute a task with automatic loading state management
  Future<void> executeTaskWithLoading(
    Future<void> Function() task, {
    bool showLoading = true,
    bool handleErrors = true,
  }) async {
    try {
      if (showLoading) {
        toggleLoading(loading: true);
      }
      await task();
    } catch (e) {
      if (handleErrors) {
        addUserMessage(e.toString());
      } else {
        rethrow;
      }
    } finally {
      if (showLoading) {
        toggleLoading(loading: false);
      }
    }
  }

  /// Execute a use case that returns a message
  Future<void> executeMessageOnlyUseCase(
    Future<Either<String, Unit>> Function() useCase, {
    String? successMessage,
  }) async {
    toggleLoading(loading: true);
    final result = await useCase();
    toggleLoading(loading: false);

    result.fold(
      (error) => addUserMessage(error),
      (_) {
        if (successMessage != null) {
          addUserMessage(successMessage);
        }
      },
    );
  }

  /// Execute a use case and handle Either results, updating UI state
  Future<void> parseDataFromEitherWithUserMessage<T>({
    required Future<Either<String, T>> Function() useCase,
    required Function(T) onSuccess,
    String? successMessage,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      toggleLoading(loading: true);
    }

    final result = await useCase();
    
    if (showLoading) {
      toggleLoading(loading: false);
    }

    result.fold(
      (error) => addUserMessage(error),
      (data) {
        onSuccess(data);
        if (successMessage != null) {
          addUserMessage(successMessage);
        }
      },
    );
  }

  /// Execute a use case, handle Either results, and return the data or null
  Future<T?> mapDataFromEitherWithUserMessage<T>({
    required Future<Either<String, T>> Function() useCase,
    String? successMessage,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      toggleLoading(loading: true);
    }

    final result = await useCase();
    
    if (showLoading) {
      toggleLoading(loading: false);
    }

    return result.fold(
      (error) {
        addUserMessage(error);
        return null;
      },
      (data) {
        if (successMessage != null) {
          addUserMessage(successMessage);
        }
        return data;
      },
    );
  }

  /// Helper method to update state
  /// 
  /// This method needs to be implemented by subclasses to handle specific state updates
  BaseUiState _updateState(
    BaseUiState currentState, {
    bool? isLoading,
    String? userMessage,
  }) {
    // This implementation is just for the base class
    // Subclasses should override this method to handle their specific state
    return BaseUiStateImpl(
      isLoading: isLoading ?? currentState.isLoading,
      userMessage: userMessage ?? currentState.userMessage,
    );
  }
}

/// Concrete implementation of BaseUiState for internal use
class BaseUiStateImpl extends BaseUiState {
  const BaseUiStateImpl({
    super.isLoading,
    super.userMessage,
  });
} 