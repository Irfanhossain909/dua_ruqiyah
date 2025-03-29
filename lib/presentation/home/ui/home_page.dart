import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presenter/home_presenter.dart';
import '../presenter/home_ui_state.dart';
import '../../booksection/ui/booksection_screen.dart';
import '../../selfruqiyah/ui/selfruqiyah_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = loadHomePresenter();

    return GetX<HomePresenter>(
      init: presenter,
      builder: (controller) {
        final state = controller.uiState.value;

        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.grid_view,
                color: Color(0xFF8BC34A),
              ), // Lighter Green
              onPressed: () {},
            ),
            title: Text('Dua & Ruqyah', style: state.sectionTitleStyle),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ), // Light Gray Background
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Become a Donor Banner
                    _buildDonorBanner(),
                    const SizedBox(height: 16),

                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: const Color(0xFF8BC34A),
                          size: 16,
                        ), // Lighter Green
                        const SizedBox(width: 8),
                        Text('Khilgaon, Dhaka', style: state.locationTextStyle),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Prayer Time Card (Dhuhr)
                    _buildPrayerTimeCard(state),
                    const SizedBox(height: 16),

                    // Small Prayer Time Cards (Seheri & Ifter)
                    _buildSmallPrayerCards(state),
                    const SizedBox(height: 24),

                    // Circular Icon Buttons (Row 1)
                    _buildIconRow([
                      _buildCircularIconButton(
                        Icons.book,
                        'Last Read',
                        Colors.blue,
                        Colors.blue[100]!,
                        null,
                      ),
                      _buildCircularIconButton(
                        Icons.emoji_events,
                        'Challenges',
                        Colors.amber,
                        Colors.amber[100]!,
                        null,
                      ),
                      _buildCircularIconButton(
                        Icons.eco,
                        'Self Ruqyah',
                        const Color(0xFF8BC34A),
                        Colors.green[100]!,
                        () => Get.toNamed('/selfruqiyah'),
                      ),
                      _buildCircularIconButton(
                        Icons.menu_book,
                        'Dua\'s Books',
                        Colors.red,
                        Colors.red[100]!,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookSectionScreen(),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),

                    // Circular Icon Buttons (Row 2)
                    _buildIconRow([
                      _buildCircularIconButton(
                        Icons.pan_tool,
                        'Dhikr',
                        const Color(0xFF8BC34A),
                        Colors.green[50]!,
                        null,
                      ), // Lighter green
                      _buildCircularIconButton(
                        Icons.access_time,
                        'Prayer Time',
                        Colors.purple,
                        Colors.purple[100]!,
                        null,
                      ),
                      _buildCircularIconButton(
                        Icons.apps,
                        'Other Apps',
                        Colors.blue,
                        Colors.blue[100]!,
                        null,
                      ),
                      _buildCircularIconButton(
                        Icons.favorite,
                        'Support Us',
                        Colors.red,
                        Colors.red[100]!,
                        null,
                      ),
                    ]),
                    const SizedBox(height: 16),

                    // Dua & Ruqyah Tabs
                    _buildTabs(state),
                    const SizedBox(height: 16),

                    // Dua Cards
                    _buildDuaCard(
                      Icons.star,
                      'Dua Importance',
                      '7 Subcategories',
                      50,
                      Colors.yellow,
                      Colors.yellow[100]!,
                      state,
                    ),
                    _buildDuaCard(
                      Icons.check_circle,
                      'Dua Acceptance',
                      '10 Subcategories',
                      33,
                      Colors.red[400]!,
                      Colors.red[50]!,
                      state,
                    ),
                    _buildDuaCard(
                      Icons.nights_stay,
                      'Time of Dua',
                      '5 Subcategories',
                      25,
                      Colors.indigo[400]!,
                      Colors.indigo[50]!,
                      state,
                    ),
                    _buildDuaCard(
                      Icons.account_balance_rounded,
                      'Hazz & Umrah',
                      '9 Subcategories',
                      42,
                      Colors.grey[700]!,
                      Colors.grey[100]!,
                      state,
                    ),
                    _buildDuaCard(
                      Icons.account_balance,
                      'Witr & Other',
                      '30 Subcategories',
                      22,
                      const Color(0xFF8BC34A),
                      Colors.green[50]!,
                      state,
                    ), // Lighter green
                    _buildDuaCard(
                      Icons.fastfood,
                      'Fasting',
                      '12 Subcategories',
                      44,
                      Colors.orange[400]!,
                      Colors.orange[50]!,
                      state,
                    ),
                    _buildDuaCard(
                      Icons.water_drop,
                      'Ablution & Bath',
                      '15 Subcategories',
                      47,
                      Colors.blue[400]!,
                      Colors.blue[50]!,
                      state,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDonorBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // Light Green Background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Color(0xFF8BC34A),
              size: 20,
            ), // Lighter Green Heart
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Become a Donor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'Your generosity can provide vital support to communities, following the noble tradition ...',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey, size: 16),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeCard(HomeUiState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF5FFF3), Color(0xFFE1F5D8)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dhuhr', style: state.prayerNameTextStyle),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('12:27', style: state.timeTextStyle),
              const SizedBox(width: 4),
              Text('PM', style: state.smallTimeTextStyle),
              const SizedBox(width: 8),
              Text(
                'to 3:54pm',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.45,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF8BC34A),
              ), // Lighter Green
              minHeight: 3, // Make it thinner
            ),
          ),
          const SizedBox(height: 4),
          Text('Remaining: 00:50:00 mins', style: state.remainingTimeTextStyle),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.nights_stay,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Magrib',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Start - 3:54pm',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dhul-Hijjah 26, 1445 AH',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Tuesday, July 2, 2024',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallPrayerCards(HomeUiState state) {
    return Row(
      children: [
        Expanded(
          child: _buildSmallPrayerCard(
            Icons.notifications_none_outlined,
            'Seheri',
            '12:27 PM',
            const Color(0xFF8BC34A),
            Colors.grey[200]!,
            state,
          ), // Lighter Green
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSmallPrayerCard(
            Icons.restaurant_outlined,
            'Ifter',
            '12:27 PM',
            const Color(0xFF8BC34A),
            Colors.grey[200]!,
            state,
          ), // Lighter Green
        ),
      ],
    );
  }

  Widget _buildSmallPrayerCard(
    IconData icon,
    String title,
    String time,
    Color iconColor,
    Color bgColor,
    HomeUiState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ), // White background
                child: Icon(icon, color: iconColor, size: 12),
              ),
              const SizedBox(width: 4),
              Text(title, style: state.smallCardTitleStyle),
            ],
          ),
          const SizedBox(height: 4),
          Text(time, style: state.smallCardTimeStyle),
        ],
      ),
    );
  }

  Widget _buildCircularIconButton(
    IconData icon,
    String label,
    Color iconColor,
    Color bgColor, [
    VoidCallback? onTap,
  ]) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildIconRow(List<Widget> icons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: icons,
    );
  }

  Widget _buildTabs(HomeUiState state) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Very Light Green
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Dua',
                  style: state.tabTextStyle.copyWith(
                    color: const Color(0xFF8BC34A),
                  ),
                ), // Lighter Green
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(child: Text('Ruqyah', style: state.tabTextStyle)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDuaCard(
    IconData icon,
    String title,
    String subtitle,
    int duaCount,
    Color? iconColor,
    Color bgColor,
    HomeUiState state,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white, // White background for Dua Cards
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: state.duaTitleStyle),
                  Text(subtitle, style: state.duaSubtitleStyle),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text('$duaCount', style: state.duaCountStyle),
                const SizedBox(width: 4),
                Text('Duas', style: state.duaCountLabelStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
