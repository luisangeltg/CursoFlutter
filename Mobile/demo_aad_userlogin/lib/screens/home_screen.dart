import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:http/http.dart' as http;

import '../router/app_routes.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  static final Color _colorNaranjaOvercast = Color(0xFFffa729);
  static final Color _colorVerdeOvercast = Color(0xFF147064);

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final Config config = Config(
      tenant: '2785529a-e1fb-4e64-b8e9-b0bb46d3c686',
      clientId: '16c40b95-0147-4f17-a293-094c5d248b04',
      scope: 'openid profile offline_access email User.Read',
      redirectUri: 'https://login.live.com/oauth20_desktop.srf',
      clientSecret: "3M87Q~Ql5uYcsfsB~VciRzEfGUvIc6ZsYaPjC");
  final AadOAuth oauth = AadOAuth(config);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              shadowColor: Colors.green.withOpacity(1),
              child: Column(children: const [
                FadeInImage(
                  image: AssetImage(
                      "assets/images/logo-overcast.jpg"), //NetworkImage(imageURL),
                  placeholder: AssetImage("assets/images/jar-loading.gif"),
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 300),
                ),
                /*if ("cardTitle" != null)
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Text("cardTitle"!),
          )*/
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () async {
                login(); //Navega a pantalla del webview
              },
              height: 40,
              splashColor: Colors.transparent,
              minWidth: double.infinity,
              color: HomeScreen._colorNaranjaOvercast,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(FontAwesomeIcons.microsoft, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Azure Sign In",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.menuOptions[0].route);
                },
                child: const Text(
                  "Go to sharepoint",
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ));
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
