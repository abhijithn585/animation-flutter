import 'package:animation/main.dart';
import 'package:animation/view/home_screen.dart';
import 'package:animation/view/widget/lang.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<Language>(
              underline: SizedBox(),
              icon: Icon(Icons.language),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(e.languageCode),
                              Text(e.name)
                            ],
                          )))
                  .toList(),
              onChanged: (Language? language) {
                if (language != null) {
                  MyApp.setLocale(context, Locale(language.languageCode));
                }
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.hiThere,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.letsGetStarted,
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: AppLocalizations.of(context)!.username,
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 37, 125),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
