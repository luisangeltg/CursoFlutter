import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:preferences_app/services/google_signin_service.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import '../share_preferences/preferences.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static String routeName = "Home";
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
    print("nombre  {$Preferences.name}");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Auth User"),
          actions: [
            IconButton(
                onPressed: () async {
                  Preferences.displayName = "";
                  Preferences.urlProfileImage = "";
                  Preferences.userEmail = "";
                  Preferences.userId = "";
                  Preferences.isLogin = false;
                  await GoogleSignInService.signOut();
                  setState(() {});
                },
                icon: const Icon(FontAwesomeIcons.doorOpen))
          ],
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Preferences.isLogin)
              Center(
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: NetworkImage(Preferences.urlProfileImage),
                ),
              ),
            if (Preferences.isLogin)
              Text("user-email: ${Preferences.userEmail}"),
            if (Preferences.isLogin) const Divider(),
            if (Preferences.isLogin)
              Text("isLogin: " + Preferences.isLogin.toString()),
            if (Preferences.isLogin) const Divider(),
            if (Preferences.isLogin)
              Text("Nombre de usuario: " + (Preferences.displayName)),
            if (Preferences.isLogin) const Divider(),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!Preferences.isLogin)
                    MaterialButton(
                      onPressed: () async {
                        GoogleSignInAccount? account =
                            await GoogleSignInService.singInWithGoogle();

                        if (account != null) {
                          Preferences.displayName = account.displayName!;
                          Preferences.urlProfileImage = account.photoUrl!;
                          Preferences.userEmail = account.email;
                          Preferences.userId = account.id;
                          Preferences.isLogin = true;
                        }

                        setState(() {});
                      },
                      splashColor: Colors.transparent,
                      minWidth: double.infinity,
                      height: 40,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.google, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Sign in with Google",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))
                          ]),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  //Azure sign in button
                  MaterialButton(
                    onPressed: () async {
                      login();

                      setState(() {});
                    },
                    splashColor: Colors.transparent,
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.microsoft, color: Colors.white),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Azure Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17))
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Azure sign out button
                  MaterialButton(
                    onPressed: () async {
                      logout();

                      setState(() {});
                    },
                    splashColor: Colors.transparent,
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.red[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.microsoft, color: Colors.white),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Azure Sign Out",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17))
                        ]),
                  )
                ],
              )),
            )
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
      print(accessToken);

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
