import "dart:io";
import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  print("## main(): FlutterBook Starting");

  startMeUp() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    // utils.docsDir = docsDir;
    runApp(FlutterBook());
  }

  startMeUp();
} /* End main(). */

class FlutterBook extends StatelessWidget {
  const FlutterBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              title: Text("FlutterBook"),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.date_range), text: "Appointments"),
                Tab(icon: Icon(Icons.contacts), text: "Contacts"),
                Tab(icon: Icon(Icons.note), text: "Notes"),
                Tab(icon: Icon(Icons.assignment_turned_in), text: "Tasks")
              ] /* End TabBar.tabs. */
                  ) /* End TabBar. */
              ),
          body: TabBarView(children: [
            Container(
              child: Text("Appointments"),
            ),
            Container(
              child: Text("Contacts"),
            ),
            Container(
              child: Text("Notes"),
            ),
            Container(
              child: Text("Tasks"),
            ),
          ]),
        ),
      ),
    );
  }
}
