// ignore_for_file: prefer_const_constructors

import 'package:api_model_conversion_jan/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() async {
    isLoading = true;
    setState(() {});
    await context.read<HomeScreenController>().getData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final homescreenprovider = context.watch<HomeScreenController>();

    return Scaffold(
      body: Center(
          child: isLoading == true
              ? CircularProgressIndicator()
              : Container(
                  child: ListView.builder(
                  itemCount: homescreenprovider.resModel?.data?.length ?? 0,
                  itemBuilder: (context, index) => ListTile(
                    leading:
                        homescreenprovider.resModel?.data?[index].avatar != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(homescreenprovider
                                        .resModel?.data?[index].avatar
                                        .toString() ??
                                    ""))
                            : CircleAvatar(),
                    title: Text(homescreenprovider
                            .resModel?.data?[index].firstName
                            .toString() ??
                        ""),
                    subtitle: Text(homescreenprovider
                            .resModel?.data?[index].email
                            .toString() ??
                        ""),
                  ),
                )
                  // data[0].email
                  )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetch();
        },
      ),
    );
  }
}
