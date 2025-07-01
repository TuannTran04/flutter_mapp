import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Expanded(flex: 4, child: Container(color: Colors.teal)),
            // Expanded(flex: 2, child: Container(color: Colors.orange)),
            // Expanded(
            //   child: Container(
            //     color: Colors.teal,
            //     height: 20.0,
            //     child: Text("Helooo"),
            //   ),
            // ), => ko dung expanded trong column -> SingleChildScrollView vi expanded se co chiem chieu dai => infinity height screen
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.teal,
                    height: 20.0,
                    child: Text("Helooo"),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.orange,
                    height: 20.0,
                    child: Text("hELLO"),
                  ),
                ),
              ],
            ),

            Divider(),

            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    color: Colors.orange,
                    height: 20.0,
                    child: Text("hELLO"),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.teal,
                    height: 20.0,
                    child: Text("Helooo"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
