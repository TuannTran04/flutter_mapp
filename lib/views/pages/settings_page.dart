import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = "e1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text("Snackbar"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Snackbar!"),
              ),

              Divider(color: Colors.teal, thickness: 5.0, endIndent: 200.0),

              Container(height: 50.0, child: VerticalDivider()),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // return AboutDialog();
                      return AlertDialog(
                        title: Text("Alert Title"),
                        content: Text("Alert Content"),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: Text("Open Dialog!"),
              ),

              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: "e1", child: Text("E1")),
                  DropdownMenuItem(value: "e2", child: Text("E2")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile(
                tristate: true,
                title: Text("Open Snackbar"),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text("SWITCH ME"),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider(
                max: 10.0,
                divisions: 10,
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                  print(value);
                },
              ),
              // GestureDetector(
              //   onTap: () {
              //     print(">>>>>>> GestureDetector");
              //   },
              //   // child: Image.asset("assets/images/hc_competitive.jpg"),
              //   child: Container(
              //     height: 50,
              //     width: double.infinity,
              //     color: Colors.white12,
              //   ),
              // ),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print(">>>>>>> InkWell");
                },
                // child: Image.asset("assets/images/hc_competitive.jpg"),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),

              // ElevatedButton(onPressed: () {}, child: Text("Click me!")),
              // FilledButton(onPressed: () {}, child: Text("Click me!")),
              // TextButton(onPressed: () {}, child: Text("Click me!")),
              // OutlinedButton(onPressed: () {}, child: Text("Click me!")),
              // CloseButton(),
              // BackButton(),
              // Image.asset("assets/images/hc_competitive.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
