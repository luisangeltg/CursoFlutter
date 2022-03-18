import 'dart:io';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class AzureAuthScreen extends StatefulWidget {
  const AzureAuthScreen({Key? key}) : super(key: key);

  @override
  State<AzureAuthScreen> createState() => _AzureAuthScreenState();
}

class _AzureAuthScreenState extends State<AzureAuthScreen> {
  static final Config config = Config(
      tenant: '2785529a-e1fb-4e64-b8e9-b0bb46d3c686',
      clientId: '16c40b95-0147-4f17-a293-094c5d248b04',
      scope: 'openid profile offline_access email User.Read',
      redirectUri: 'https://login.live.com/oauth20_desktop.srf',
      clientSecret: "3M87Q~Ql5uYcsfsB~VciRzEfGUvIc6ZsYaPjC");
  final AadOAuth oauth = AadOAuth(config);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (builder) {
          return CupertinoAlertDialog(
            title: const Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Este es el contenido de la alerta"),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(size: 100)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Ok")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar",
                      style: TextStyle(color: Colors.red)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            "https://outlook.office.com/mail/", //"https://sifragc.sharepoint.com/sites/Overcast",
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.info),
          onPressed: () async {
            logout();

            setState(() {});
          }),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login() async {
    try {
      await oauth.login();
      var accessToken = await oauth.getAccessToken();
      getAadUserInfo(accessToken!);

      final url =
          Uri(scheme: "https", host: "graph.microsoft.com", path: "/v1.0/me");

      final userInf = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": 'Bearer $accessToken'
      });
      print("======= AZURE ========");
      print(userInf.body);
      showMessage('Logged in successfully,' + userInf.body.toString());
    } catch (e) {
      showError(e);
    }
  }

  void getAadUserInfo(String token) async {
    try {
      final url =
          Uri(scheme: "https", host: "graph.microsoft.com", path: "/v1.0/me");

      final userInf = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": 'Bearer $token'
      });
      print("======= AZURE ========");
      print(userInf.body);
    } catch (e) {
      print("Azure: " + e.toString());
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage('Logged out');
  }
}
