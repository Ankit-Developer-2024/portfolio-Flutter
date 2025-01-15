import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:portfolio/core/enum/app_enum.dart';

class SendEmailServices {
  static sendMail({
    required name,
    required email,
    required message,
  }) async {
    try {
      var endPointURL =
          Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      var response = await http.post(endPointURL,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'service_id': 'service_8l8typ9',
            "template_id": "template_4wlgk1g",
            'user_id': 'JG2IkpPLsrQ2pPT6j',
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_subject':
                  'Portfolio Inquiry - Someone Wants to Connect with You',
              'user_message': message
            }
          }));

      if (response.statusCode == 200) {
        toast(title: "Message send successfully", icon: ToastIcon.success);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        toast(
            title: "Something went wrong",
            subTitle: "Unable to send Message",
            icon: ToastIcon.success);
      }
    }
  }
}
