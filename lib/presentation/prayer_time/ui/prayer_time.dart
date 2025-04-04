import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../presenter/prayer_time_presenter.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.put(PrayerTimePresenter());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE7F5E9), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                _buildHeader(),
                _buildCurrentPrayer(presenter.uiState.value),
                _buildPrayerTimesList(presenter.uiState.value),
                _buildIfterCard(presenter.uiState.value),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, size: 16.sp),
          ),
          SizedBox(width: 2.w),
          Text(
            'Prayer Time',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined, size: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPrayer(PrayerTimeState state) {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Now',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h),
                Text(
                  state.currentPrayer,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  state.location,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 0.2.h),
                Text(
                  state.hijriDate,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                ),
                Text(
                  '17 July, 2024',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 25), // Increased spacing between content and circle
          _buildRemainingTimeCircle(state),
        ],
      ),
    );
  }

  Widget _buildRemainingTimeCircle(PrayerTimeState state) {
    return Container(
      margin: EdgeInsets.only(top: 1.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 32.w,
            height: 32.w,
            child: CircularProgressIndicator(
              value: 0.75,
              strokeWidth: 5,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.remainingTime,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 0.3.h),
              Text(
                'Remaining ${state.currentPrayer}',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesList(PrayerTimeState state) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        itemCount: state.prayerTimes.length,
        itemBuilder: (context, index) {
          final prayer = state.prayerTimes[index];
          return _buildPrayerTimeItem(
            prayer.name,
            prayer.time,
            extra: prayer.extra,
            isActive: prayer.isActive,
          );
        },
      ),
    );
  }

  Widget _buildPrayerTimeItem(
    String name,
    String time, {
    String? extra,
    bool isActive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: [
          Icon(
            _getPrayerIcon(name),
            size: 20.sp,
            color: isActive ? Color(0xFF4CAF50) : Colors.grey[600],
          ),
          SizedBox(width: 4.w),
          Text(
            name,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? Colors.black : Colors.grey[700],
            ),
          ),
          if (extra != null) ...[
            SizedBox(width: 2.w),
            Text(
              extra,
              style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
            ),
          ],
          Spacer(),
          Text(
            time,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? Colors.black : Colors.grey[700],
            ),
          ),
          SizedBox(width: 2.w),
          Icon(Icons.notifications_none, size: 20.sp, color: Colors.grey[400]),
        ],
      ),
    );
  }

  IconData _getPrayerIcon(String prayer) {
    switch (prayer.toLowerCase()) {
      case 'fazar':
        return Icons.nightlight_round;
      case 'sunrise':
        return Icons.wb_sunny_outlined;
      case 'dhuhr':
        return Icons.wb_sunny;
      case 'asr':
        return Icons.wb_sunny_outlined;
      case 'sunset':
      case 'magrib':
        return Icons.wb_twilight;
      case 'esha':
        return Icons.nights_stay;
      default:
        return Icons.access_time;
    }
  }

  Widget _buildIfterCard(PrayerTimeState state) {
    return Container(
      margin: EdgeInsets.all(4.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Remaining Iftar',
            style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 1.h),
          Text(
            state.remainingIftar,
            style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Suhoor',
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                  ),
                  Text(
                    state.suhoorTime,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(height: 8.h, width: 1, color: Colors.grey[300]),
              Column(
                children: [
                  Text(
                    'Iftar',
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                  ),
                  Text(
                    state.iftarTime,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
