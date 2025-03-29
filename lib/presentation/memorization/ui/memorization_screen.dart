import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemorizationScreen extends StatelessWidget {
  const MemorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for UI demo
    final samplePlans = [
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

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F5),
      appBar: _buildAppBar(),
      body: _buildBody(samplePlans),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
              Icons.menu_book_outlined,
              color: Color(0xFF457363),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Memorization',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.bookmark_border_outlined,
            color: Color(0xFF457363),
          ),
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

  Widget _buildBody(List<MemorizationPlanModel> plans) {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child:
              plans.isEmpty
                  ? const Center(child: Text('No memorization plans available'))
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: plans.length,
                    itemBuilder: (context, index) {
                      final plan = plans[index];
                      return _buildPlanCard(plan);
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
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
          hintText: 'Search by Plan',
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildPlanCard(MemorizationPlanModel plan) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plan.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side with days and details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${plan.daysLeft}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Days Left',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildStatusRow(
                      icon: Icons.notifications_off_outlined,
                      text: 'Turned Of',
                      iconColor: Colors.red.shade300,
                    ),
                    const SizedBox(height: 8),
                    _buildStatusRow(
                      icon: Icons.hexagon_outlined,
                      text:
                          'Completed: ${plan.completedItems}/${plan.totalItems}',
                      iconColor: const Color(0xFF457363),
                    ),
                    const SizedBox(height: 8),
                    _buildStatusRow(
                      icon: Icons.school_outlined,
                      text: 'Day Remaining: ${plan.daysRemaining}',
                      iconColor: const Color(0xFF457363),
                    ),
                    const SizedBox(height: 8),
                    _buildStatusRow(
                      icon: Icons.access_time,
                      text:
                          'Ends in ${DateFormat('MMM dd, yyyy').format(plan.endDate)}',
                      iconColor: const Color(0xFF457363),
                    ),
                  ],
                ),
              ),

              // Right side with progress circle
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: plan.progress,
                        strokeWidth: 8,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF457363),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(plan.progress * 100).toInt()}%',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF457363),
                            ),
                          ),
                          const Text(
                            'Completed',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow({
    required IconData icon,
    required String text,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF457363),
      child: const Icon(Icons.add),
      onPressed: () {
        // Create new plan logic
      },
    );
  }
}

/// Simple data model for memorization plan
class MemorizationPlanModel {
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
}
