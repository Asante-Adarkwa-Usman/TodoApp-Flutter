import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 50.0,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
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
        ),
      ),
      floatingActionButton:
          const FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                // shape:
                builder: (context) {
                  return ListView(
                    children: [],
                  );
                });
          },
          child: Container(
              height: 50.0,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // color: Colors.blue,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: customBlue),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Completed',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: customBlue)),
                      const Icon(Icons.keyboard_arrow_down, color: customBlue)
                    ],
                  ),
                  Text('24',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: customBlue)),
                ],
              )),
        ),
      ),
    );
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
        leading: Icon(Icons.check_circle_outline_rounded,
            size: 30, color: dateColor('Today')),
        title: Text("Plan trip to Finland",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20)),
        subtitle: Text("Plan for the family's trip next summer",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.grey)),
        trailing: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: dateColor('Yesterday')),
          label: Text(
            "Yesterday",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: dateColor('Yesterday')),
          ),
        ),
      ),
    );
  }
}
