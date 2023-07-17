import 'package:enset_app/model/users.model.dart';
import 'package:flutter/material.dart';

class GitRepositories extends StatelessWidget {
  final User user;
  const GitRepositories({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users${user.login} Repositories"),
      ),
      body: Container(
        
      ),
    );
  }
}