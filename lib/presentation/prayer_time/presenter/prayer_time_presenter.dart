import '../../../core/base/base_presenter.dart';
import '../../../core/base/base_ui_state.dart';

class PrayerTimeState extends BaseUiState {
  final String currentPrayer;
  final String location;
  final String hijriDate;
  final String remainingTime;
  final List<PrayerTime> prayerTimes;
  final String suhoorTime;
  final String iftarTime;
  final String remainingIftar;

  const PrayerTimeState({
    required this.currentPrayer,
    required this.location,
    required this.hijriDate,
    required this.remainingTime,
    required this.prayerTimes,
    required this.suhoorTime,
    required this.iftarTime,
    required this.remainingIftar,
    super.isLoading = false,
    super.userMessage,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    currentPrayer,
    location,
    hijriDate,
    remainingTime,
    prayerTimes,
    suhoorTime,
    iftarTime,
    remainingIftar,
  ];

  PrayerTimeState copyWith({
    String? currentPrayer,
    String? location,
    String? hijriDate,
    String? remainingTime,
    List<PrayerTime>? prayerTimes,
    String? suhoorTime,
    String? iftarTime,
    String? remainingIftar,
    bool? isLoading,
    String? userMessage,
  }) {
    return PrayerTimeState(
      currentPrayer: currentPrayer ?? this.currentPrayer,
      location: location ?? this.location,
      hijriDate: hijriDate ?? this.hijriDate,
      remainingTime: remainingTime ?? this.remainingTime,
      prayerTimes: prayerTimes ?? this.prayerTimes,
      suhoorTime: suhoorTime ?? this.suhoorTime,
      iftarTime: iftarTime ?? this.iftarTime,
      remainingIftar: remainingIftar ?? this.remainingIftar,
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
    );
  }
}

class PrayerTime {
  final String name;
  final String time;
  final String? extra;
  final bool isActive;

  const PrayerTime({
    required this.name,
    required this.time,
    this.extra,
    this.isActive = false,
  });
}

class PrayerTimePresenter extends BasePresenter<PrayerTimeState> {
  PrayerTimePresenter()
    : super(
        PrayerTimeState(
          currentPrayer: 'DHUHR',
          location: 'Dhaka, Bangladesh',
          hijriDate: '11 Jumada Al-Akhirah, 1441',
          remainingTime: '03:15:00',
          prayerTimes: [
            PrayerTime(name: 'Fazar', time: '4:50 AM', extra: '+5 min'),
            PrayerTime(name: 'Sunrise', time: '4:50 AM'),
            PrayerTime(name: 'Dhuhr', time: '11:40 AM', isActive: true),
            PrayerTime(name: 'Asr', time: '2:50 PM'),
            PrayerTime(name: 'Sunset', time: '5:30 PM'),
            PrayerTime(name: 'Magrib', time: '5:30 PM'),
            PrayerTime(name: 'Esha', time: '7:50 PM'),
          ],
          suhoorTime: '04:30 am',
          iftarTime: '05:31 pm',
          remainingIftar: '03:15:00',
        ),
      );

  // Add methods for updating prayer times, calculating remaining time, etc.
  void updatePrayerTimes() {
    // Implementation for updating prayer times
  }

  void updateRemainingTime() {
    // Implementation for updating remaining time
  }
}
