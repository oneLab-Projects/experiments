import 'dart:convert';
import 'package:onelab_experiments/api/github_user.dart';
import 'api_client.dart';
import 'package:http/http.dart' as http;

class GithubApiClient extends ApiClient
{

  Future<GithubUser> getUserByID(int id) async {
    final http.Response result = await http.get("https://api.github.com/user/${id}");
    assert(result.statusCode == 200);
    return GithubUser.fromJson(jsonDecode(result.body));
  }

  Future<List<GithubUser>> getUsersByIDs(List<int> ids) async
    => await Future.wait(ids.map(getUserByID));
} 