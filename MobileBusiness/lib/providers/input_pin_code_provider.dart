import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:flutter/cupertino.dart';

class InputPinCodeProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  final _input1TextEditController = TextEditingController();
  final _input2TextEditController = TextEditingController();
  final _input3TextEditController = TextEditingController();
  final _input4TextEditController = TextEditingController();

  TextEditingController get input1Controller => _input1TextEditController;
  TextEditingController get input2Controller => _input2TextEditController;
  TextEditingController get input3Controller => _input3TextEditController;
  TextEditingController get input4Controller => _input4TextEditController;

  void submitData(BuildContext context) async {
    String code = await secureStorage.readSecureData("code");
    String codeInput = _input1TextEditController.text +
        _input2TextEditController.text +
        _input3TextEditController.text +
        _input4TextEditController.text;
    if (code != codeInput) {
      showToastFail("Code verification not match");
    } else {
      showToastSuccess("Register successfully");
      Navigator.of(context).pushReplacementNamed('/success');
      _input1TextEditController.clear();
      _input2TextEditController.clear();
      _input3TextEditController.clear();
      _input4TextEditController.clear();
      notifyListeners();
    }
  }
}
