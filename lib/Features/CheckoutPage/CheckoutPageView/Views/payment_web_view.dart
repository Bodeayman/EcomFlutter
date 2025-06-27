import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebView({required this.paymentUrl, super.key});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;
  bool _hasPopped = false;

  @override
  void initState() {
    super.initState();

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (request) {
                final url = request.url;
                debugPrint("Navigating to: $url");

                if (url.contains("success=true")) {
                  _handleResult(true);
                  debugPrint("Success");
                  return NavigationDecision.prevent;
                } else if (url.contains("success=false")) {
                  _handleResult(false);
                  debugPrint("Failure");

                  return NavigationDecision.prevent;
                }

                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  void _handleResult(bool success) {
    if (_hasPopped) return; // Prevent multiple pops

    _hasPopped = true;

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) Navigator.of(context).pop(success);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete Payment")),
      body: WebViewWidget(controller: _controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
