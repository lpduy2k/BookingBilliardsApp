import 'package:booking_billiards_app/utils/format_image.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    final bigPicturePath = await FormmatImage.downloadFile(
        'https://firebasestorage.googleapis.com/v0/b/bookingbilliardsapp.appspot.com/o/images%2F1647955918367.8076.jpg?alt=media&token=8ead4f4a-0e1f-4ef8-be2c-3d3104f25b82',
        'bigPicture');

    final largeIconPath = await FormmatImage.downloadFile(
        'https://firebasestorage.googleapis.com/v0/b/bookingbilliardsapp.appspot.com/o/images%2F1647955175259.5276.jpg?alt=media&token=18cdd376-5e6a-4bc2-bc2a-3aafcbf3bd01',
        'largeIcon');

    final styleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      largeIcon: FilePathAndroidBitmap(largeIconPath),
    );

    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        playSound: true,
        styleInformation: styleInformation,
      ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);

    final details = await _notification.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }

    await _notification.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
  }

  static Future showScheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async =>
      _notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.UTC),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
}
