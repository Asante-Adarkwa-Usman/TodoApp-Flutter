import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leadingWidth: 40.0,
          title: const Text('My Tasks'),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 45.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, index) {
            return const TodoTileWidget();
          },
          separatorBuilder: (BuildContext context, index) {
            return const SizedBox(
              height: 20.0,
            );
          },
          itemCount: 10,
        ));
  }
}

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            const Icon(Icons.check_circle_outline_rounded, color: Colors.pink),
        title: const Text("Plan trip to Finland"),
        subtitle: const Text("Plan for the family's trip next summer"),
        trailing: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.pink),
          label: const Text(
            "Yesterday",
            style: TextStyle(color: Colors.pink),
          ),
        ),
      ),
    );
  }
}
