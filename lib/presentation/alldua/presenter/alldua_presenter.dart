import 'package:get/get.dart';
import 'alldua_ui_state.dart';

class AllDuaPresenter extends GetxController {
  final _state = const AllDuaUiState().obs;
  AllDuaUiState get state => _state.value;

  // Sample data for the list of duas
  final List<Map<String, dynamic>> duas = [
    {
      'id': 1,
      'title': 'A dhikr which is light on tongue, Heavy on the balance',
    },
    {
      'id': 2,
      'title': 'A dua of the treasures of Paradise',
      'highlighted': true,
    },
    {'id': 3, 'title': 'A dua which can be recited all the time'},
    {'id': 4, 'title': 'A very beautiful Dua or Dhikr'},
    {'id': 5, 'title': 'About Lailatul Qadr'},
    {'id': 6, 'title': 'About meeting #1'},
    {'id': 7, 'title': 'About meeting #2'},
    {'id': 8, 'title': 'About meeting #3'},
  ];

  // Method to filter duas based on search query
  List<Map<String, dynamic>> filterDuas(String query) {
    if (query.isEmpty) {
      return duas;
    }
    return duas
        .where(
          (dua) => dua['title'].toString().toLowerCase().contains(
            query.toLowerCase(),
          ),
        )
        .toList();
  }

  void setLoading(bool loading) {
    _state.value = state.copyWith(isLoading: loading);
  }

  void setUserMessage(String? message) {
    _state.value = state.copyWith(userMessage: message);
  }
}
