import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F6),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.5.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF457363).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.grid_view,
                          color: const Color(0xFF457363),
                          size: 6.w,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        child: Icon(
                          Icons.bookmark_outline,
                          color: const Color(0xFF457363),
                          size: 6.w,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: const Color(0xFF457363),
                          size: 6.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey, size: 6.w),
                    SizedBox(width: 3.w),
                    Text(
                      'Search by Plan',
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Schedule list
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.5.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F6F6),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: const Color(0xFF457363),
                              size: 6.w,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Schedule Name',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Icon(Icons.more_vert, color: Colors.grey),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Total Dua: 3',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Schedule time: 9:30AM',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Floating action button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w, bottom: 3.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF457363),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF457363).withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color(0xFF457363),
                    elevation: 0,
                    child: Icon(Icons.add, color: Colors.white, size: 7.w),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
