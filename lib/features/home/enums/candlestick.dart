import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/resources/colors.dart';
import 'package:roqqu/resources/resources.dart';

enum CandlestickValue {
  oneHour,
  twoHours,
  fourHours,
  oneDay,
  oneWeek,
  oneMonth,
  chart,
  fx;

  String  get title {
    switch (this) {
      case oneHour:
        return '1h';
      case twoHours:
        return '2h';
      case fourHours:
        return '4h';
      case oneDay:
        return '1d';
      case oneWeek:
        return '1w';
      case oneMonth:
        return '1m';
      case chart:
        return 'Chart';
      case fx:
        return 'FX';
    }
  }

  Widget get icon {
    switch (this) {
      case oneHour:
        return Text(
          '1H',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      case twoHours:
        return Text(
          '2H',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      case fourHours:
        return Text(
          '4H',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      case oneDay:
        return Text(
          '1D',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      case oneWeek:
        return Text(
          '1W',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      case oneMonth:
        return Text(
          '1M',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      case chart:
        return SvgPicture.asset(SvgIcons.chartD);
      case fx:
        return Text(
          'FX',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
    }
  }
}
