import 'package:flutter/material.dart';
import 'package:flutter_app/data/constants.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        // SingleChildScrollView default day phan tu len top nen phai boc Center de can giua duoc
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // HeroWidget(title: widget.title),
                // SizedBox(height: 20.0),
                Lottie.asset('assets/lotties/welcome.json', height: 400.0),

                SizedBox(height: 20.0),

                Text(
                  "Flutter Mapp is siiuuuuuuu",
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),

                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // return WidgetTree();
                          return LoginPage(title: "Register");
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text("Next"),
                ),

                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
