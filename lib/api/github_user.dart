

import 'package:flutter/material.dart';

class GithubUser
{
  final int id;

  final String nickname;
  final String name;
  final Uri avatar;

  GithubUser({
    @required
    this.id,
    @required
    this.nickname,
    @required
    this.name,
    @required
    this.avatar
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
      id: json["id"], 
      nickname: json["login"], 
      name: json["name"],
      avatar: Uri.parse(json["avatar_url"])
    );
  }
}