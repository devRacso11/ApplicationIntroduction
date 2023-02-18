
import 'package:flutter/material.dart';

import 'package:widgets_flutter/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('A P P  I N T R O D U C T I O N'),
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          leading: Icon(AppRoutes.menuOptions[i].icon),
          title: Text(AppRoutes.menuOptions[i].name),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.menuOptions[i].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: AppRoutes.menuOptions.length,
      ),
    );
  }
}
