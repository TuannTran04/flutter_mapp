import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/classes/activity_class.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Future<Activity>? futureActivity;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    futureActivity = fetchActivity();
  }

  Future<Activity> fetchActivity() async {
    final response = await http.get(
      Uri.parse('https://bored-api.appbrewery.com/random'),
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Activity.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load activity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Activity"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
            icon: Icon(Icons.switch_access_shortcut),
          ),
        ],
      ),

      body: Center(
        child: FutureBuilder<Activity>(
          future: futureActivity,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData) {
              return const Text("No activity found.");
            } else {
              final activity = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedCrossFade(
                  firstChild: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "🎯 ${activity.activity}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text("Type: ${activity.type}"),
                          Text("Participants: ${activity.participants}"),
                          Text("Price: ${activity.price}"),
                          Text("Duration: ${activity.duration}"),
                          Text("Accessibility: ${activity.accessibility}"),
                          Text(
                            "Kid Friendly: ${activity.kidFriendly ? 'Yes' : 'No'}",
                          ),
                          if (activity.link.isNotEmpty)
                            Text("Link: ${activity.link}"),
                        ],
                      ),
                    ),
                  ),
                  secondChild: Center(
                    child: Image.asset("assets/images/logo.jpg"),
                  ),
                  crossFadeState:
                      isFirst
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 300),
                ),
              );
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            futureActivity = fetchActivity();
          });
        },
      ),
    );
  }
}
