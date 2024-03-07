import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashReporter{

  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  Future<bool> reportProblem ({ String? msg, List<String>? info }) async{
    try {
      if (info != null) {
        await _crashlytics.recordError(msg, null, information: info);
      } else {
        await _crashlytics.recordError(msg, null);
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}