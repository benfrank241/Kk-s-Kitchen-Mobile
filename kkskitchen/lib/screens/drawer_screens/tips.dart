import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tips extends StatelessWidget {

  final Uri _url = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 133, 255, 255),
            centerTitle: true,
            title: Text("Consider Donating")),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            child: ElevatedButton(
              child: Text('PayPal'),
              onPressed: () async{
                final url = 'https://www.paypal.com/donate/?business=E4V7USGWGQF9E&no_recurring=0&item_name=Proceeds+will+help+cover+expenses+associated+with+the+Kk%27s+kitchen+such+as+gas%2C+wages+and+cleaning+supplies.&currency_code=USD';

                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: true,
                    forceWebView: true,
                    enableJavaScript: true);
                }
              },
              ),
            ),
            );
  }

 void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
}
