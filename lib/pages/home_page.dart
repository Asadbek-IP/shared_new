import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  soniOlish() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    setState(() {
      count = shared.getInt("son") ?? 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    soniOlish();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$count",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      count = count - 1;
                    });
                    SharedPreferences shared =
                        await SharedPreferences.getInstance();
                    shared.setInt("son", count);
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      count = count + 1;
                    });
                    SharedPreferences shared =
                        await SharedPreferences.getInstance();
                    shared.setInt("son", count);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences shared =
                      await SharedPreferences.getInstance();
                  shared.remove("son");

                },
                child: Text("O'chirish"))
          ],
        ),
      ),
    );
  }
}
