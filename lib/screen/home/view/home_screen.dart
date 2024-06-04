import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Light"),
                ),
                PopupMenuItem(
                  child: Text("Dark"),
                ),
                PopupMenuItem(child: Text("System"))
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.read<HomeProvider>().contactList.length,
              itemBuilder: (context, index) {
                return Consumer(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                "${context.read<HomeProvider>().contactList[index].name}"),
                            Text("hl"),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
