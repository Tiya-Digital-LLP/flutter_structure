import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderapp/utils/custom_toast.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> order = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;

  RxBool orderError = false.obs;
  RxBool mobileError = false.obs;

  RxBool isOrderTyping = false.obs;
  RxBool isMobileTyping = false.obs;

  var isLoading = false.obs;

  void orderValidation() {
    if (order.value.text.isEmpty) {
      orderError.value = true;
    } else {
      orderError.value = false;
    }

    if (orderError.value) {
      isOrderTyping.value = true;
    }
  }

  void mobileValidation() {
    if (mobile.value.text.isEmpty || mobile.value.text.length != 10) {
      mobileError.value = true;
    } else {
      mobileError.value = false;
    }

    if (mobileError.value) {
      isMobileTyping.value = true;
    }
  }

  void loginValidation(BuildContext context, String value) {
    // Force typing state to true for validation display
    FocusScope.of(context).unfocus();
    isOrderTyping.value = true;
    isMobileTyping.value = true;

    // Perform validation
    orderValidation();
    mobileValidation();

    if (order.value.text.isEmpty && mobile.value.text.isEmpty) {
      showToasterrorborder("This Field Is Required", context);
    } else if (order.value.text.isEmpty) {
      showToasterrorborder("Please Enter OrderID ", context);
    } else if (mobile.value.text.isEmpty) {
      showToasterrorborder("Please Enter Mobile Number", context);
    } else {
      isLoading(true);
      // login(context).then((_) => isLoading(false));
    }
  }

  // Future<void> login(BuildContext context) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('${Constants.baseUrl}${Constants.login}'),
  //       body: {'phone': mobile.value.text, 'order_id': order.value.text},
  //     );

  //     if (kDebugMode) {
  //       print('Response status: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //     }

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);
  //       LoginEntity loginEntity = LoginEntity.fromJson(responseData);

  //       if (loginEntity.result == 1) {
  //         if (kDebugMode) {
  //           print('Login successful! Full response: $responseData');
  //         }
  //         // ignore: use_build_context_synchronously
  //         showToastverifedborder('Login successfully', context);

  //         Get.offAllNamed(Routes.main);
  //       } else {
  //         // ignore: use_build_context_synchronously
  //         showToasterrorborder(loginEntity.message ?? "Login failed", context);
  //       }
  //     } else {
  //       // ignore: use_build_context_synchronously
  //       showToasterrorborder("Login failed: ${response.reasonPhrase}", context);
  //     }
  //   } finally {
  //     isLoading(false); // Hide loader
  //   }
  // }
}
