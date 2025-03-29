import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../presenter/alldua_presenter.dart';
import '../presenter/alldua_ui_state.dart';

class AllDuaScreen extends StatefulWidget {
  const AllDuaScreen({Key? key}) : super(key: key);

  @override
  State<AllDuaScreen> createState() => _AllDuaScreenState();
}

class _AllDuaScreenState extends State<AllDuaScreen> {
  final AllDuaPresenter presenter = Get.put(AllDuaPresenter());
  final TextEditingController _searchController = TextEditingController();
  final RxString _searchQuery = ''.obs;
  final RxBool _isSortingExpanded = false.obs;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _searchQuery.value = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              _buildHeader(),
              SizedBox(height: 2.h),
              _buildSearchBar(),
              SizedBox(height: 1.h),
              _buildSortingSection(),
              SizedBox(height: 1.h),
              _buildDuasList(),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F4F1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF457363),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF457363),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 3.w),
        Obx(() {
          return Text('All Duas', style: presenter.state.titleStyle);
        }),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: 'Search by dua\'s name',
          hintStyle: presenter.state.searchHintStyle,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: Color(0xFF9E9E9E)),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildSortingSection() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _isSortingExpanded.value = !_isSortingExpanded.value;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Sorting Type',
                  style: presenter.state.sortingTitleStyle,
                ),
                Icon(
                  _isSortingExpanded.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          // Sorting options would go here if expanded
        ],
      );
    });
  }

  Widget _buildDuasList() {
    return Expanded(
      child: Obx(() {
        final filteredDuas = presenter.filterDuas(_searchQuery.value);
        return Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredDuas.length,
              itemBuilder: (context, index) {
                final dua = filteredDuas[index];
                final isHighlighted = dua['highlighted'] == true;

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color:
                        isHighlighted
                            ? const Color(0xFFECF4F0)
                            : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            isHighlighted
                                ? const Color(0xFF457363)
                                : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          dua['id'].toString(),
                          style: presenter.state.itemNumberStyle.copyWith(
                            color:
                                isHighlighted
                                    ? Colors.white
                                    : const Color(0xFF457363),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      dua['title'],
                      style: presenter.state.itemTitleStyle,
                    ),
                    onTap: () {
                      // Handle dua selection
                    },
                  ),
                );
              },
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: SizedBox(
                width: 20,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  children: List.generate(
                    26,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Center(
                        child: Text(
                          String.fromCharCode(65 + index), // A-Z
                          style: presenter.state.alphabetStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
