import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashReporter{

  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  Future<bool> reportProblem (String msg) async{
    try {
      await _crashlytics.recordError(msg, null, information: ["gg", "gg2"]);
      return true;
    } catch (e) {
      return false;
    }
  }
}