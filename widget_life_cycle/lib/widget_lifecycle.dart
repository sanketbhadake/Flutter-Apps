import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_life_cycle/screen2.dart';

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<WidgetLifecycle> createState() {
    log("In create State");
    return _WidgetLifecycleState();
  }
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  String str = "C2W";
  @override
  Widget build(BuildContext context) {
    log("Widget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Life Cycle"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Screen2(text: str),
            const Text(''),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                str == "C2W" ? 'core2web' : 'C2W';
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Screen2(
                          text: str,
                        )));
              },
              child: const Text("Change Text"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Screen2(
                  text: str,
                )));
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    log("initState()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("didChangeDependencies()");
  }

  @override
  void deactivate() {
    super.deactivate();
    log("deactivate()");
  }

  @override
  void dispose() {
    super.dispose();
    log("dispose()");
  }
}
