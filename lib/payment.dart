import 'package:flutter/material.dart';
import 'package:logykinfotech_webview/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(Payment());
}
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://logykinfotech.com/payment.php',
        onWebViewCreated: (controller){
          this.controller = controller;
        },
        onPageFinished: (String url) {
          controller
              .evaluateJavascript("javascript:(function() { " +
              "var head = document.getElementsByTagName('header')[0];" +
              "head.parentNode.removeChild(head);" +
              "var footer = document.getElementsByTagName('footer')[0];" +
              "footer.parentNode.removeChild(footer);" +
              "})()")
              .then((value) =>
              debugPrint('Page finished loading Javascript'))
              .catchError((onError) => debugPrint('$onError'));
        },
      ),
    );
  }
}
