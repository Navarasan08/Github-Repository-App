import 'package:equatable/equatable.dart';

class Repository extends Equatable {
  final int id;
  final String name;
  final String description;
  final String userName;
  final String userAvatarUrl;
  final int forksCount;
  final int starsCount;

  Repository({
    this.id,
    this.name,
    this.description,
    this.userName,
    this.userAvatarUrl,
    this.forksCount,
    this.starsCount,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      name: json['full_name'],
      starsCount: json['stargazers_count'] ?? 0,
      forksCount: json['forks_count'] ?? 0,
      description: json['description'],
      userName: json['owner'] != null ? json['owner']['login'] : null,
      userAvatarUrl: json['owner'] != null ? json['owner']['avatar_url'] : null,
    );
  }

  static List<Repository> getRepoLists(List jsonList) {
    List<Repository> repos = [];

    if (jsonList != null && jsonList.isNotEmpty) {
      jsonList.forEach((json) {
        repos.add(Repository.fromJson(json));
      });
    }

    return repos;
  }

  @override
  List<Object> get props => [this.id];
}
