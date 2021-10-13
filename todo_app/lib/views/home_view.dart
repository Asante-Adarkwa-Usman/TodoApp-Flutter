import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/shared_widgets/todo_tile_widget.dart';
import 'package:todo_app/utilities/utils.dart';
import 'package:todo_app/views/create_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 50,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
        ),
        title: const Text('My Tasks'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return const TodoTileWidget(
              status: false,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 10),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CreateTodoView();
          }));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CompletedTodoWidget();
                });
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: customBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Completed',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600, color: customBlue),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: customBlue,
                    )
                  ],
                ),
                Text(
                  '24',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: customBlue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedTodoWidget extends StatelessWidget {
  const CompletedTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return const TodoTileWidget(
            status: true,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
