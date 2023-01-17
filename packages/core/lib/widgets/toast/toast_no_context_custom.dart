import 'package:fluttertoast/fluttertoast.dart';

class FutterToastNoContext {
  static void showToastMessage(String message, {ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 3);
  }
}
