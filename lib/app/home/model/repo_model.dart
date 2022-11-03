// To parse this JSON data, do
//
//     final repoModel = repoModelFromJson(jsonString);

import 'dart:convert';

RepoModel repoModelFromJson(String str) => RepoModel.fromJson(json.decode(str));

String repoModelToJson(RepoModel data) => json.encode(data.toJson());

class RepoModel {
  RepoModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int? totalCount;
  bool? incompleteResults;
  List<Item>? items;

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.homepage,
    this.size,
    this.stargazersCount,
    // this.watchersCount,
    this.language,
    this.hasIssues,
    this.topics,
    this.visibility,
    // this.forks,
    // this.openIssues,
    // this.watchers,
    this.defaultBranch,
    // this.score,
  });

  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? hooksUrl;
  String? issueEventsUrl;
  String? eventsUrl;

  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? pushedAt;

  String? homepage;
  int? size;
  int? stargazersCount;
  // int? watchersCount;
  String? language;
  bool? hasIssues;

  //int? forksCount;

  List<String>? topics;
  Visibility? visibility;
  // int? forks;
  // int? openIssues;
  // int? watchers;
  DefaultBranch? defaultBranch;
  //int? score;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        owner: Owner.fromJson(json["owner"]),
        htmlUrl: json["html_url"],
        description: json["description"],
        fork: json["fork"],
        url: json["url"],
        forksUrl: json["forks_url"],
        keysUrl: json["keys_url"],
        collaboratorsUrl: json["collaborators_url"],
        teamsUrl: json["teams_url"],
        hooksUrl: json["hooks_url"],
        issueEventsUrl: json["issue_events_url"],
        eventsUrl: json["events_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        homepage: json["homepage"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        // watchersCount: json["watchers_count"],
        language: json["language"],
        hasIssues: json["has_issues"],
        topics: List<String>.from(json["topics"].map((x) => x)),
        visibility: visibilityValues.map[json["visibility"]],
        // forks: json["forks"],
        // openIssues: json["open_issues"],
        // watchers: json["watchers"],
        defaultBranch: defaultBranchValues.map[json["default_branch"]],
        // score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "private": private,
        "owner": owner!.toJson(),
        "html_url": htmlUrl,
        "description": description,
        "fork": fork,
        "url": url,
        "forks_url": forksUrl,
        "keys_url": keysUrl,
        "collaborators_url": collaboratorsUrl,
        "teams_url": teamsUrl,
        "hooks_url": hooksUrl,
        "issue_events_url": issueEventsUrl,
        "events_url": eventsUrl,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pushed_at": pushedAt!.toIso8601String(),
        "homepage": homepage,
        "size": size,
        "stargazers_count": stargazersCount,
        // "watchers_count": watchersCount,
        "language": language,
        "has_issues": hasIssues,
        // "forks_count": forksCount,
        "topics": List<dynamic>.from(topics!.map((x) => x)),
        "visibility": visibilityValues.reverse![visibility],
        // "forks": forks,
        // "open_issues": openIssues,
        // "watchers": watchers,
        "default_branch": defaultBranchValues.reverse![defaultBranch],
        // "score": score,
      };
}

enum DefaultBranch { MAIN, MASTER, PATHFINDER, NEXT }

final defaultBranchValues = EnumValues({
  "main": DefaultBranch.MAIN,
  "master": DefaultBranch.MASTER,
  "next": DefaultBranch.NEXT,
  "pathfinder": DefaultBranch.PATHFINDER
});

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  factory License.fromJson(Map<String, dynamic> json) => License(
        key: json["key"],
        name: json["name"],
        spdxId: json["spdx_id"],
        url: json["url"],
        nodeId: json["node_id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "spdx_id": spdxId,
        "url": url,
        "node_id": nodeId,
      };
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  Type? type;
  bool? siteAdmin;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: typeValues.map[json["type"]],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": typeValues.reverse![type],
        "site_admin": siteAdmin,
      };
}

enum Type { USER, ORGANIZATION }

final typeValues =
    EnumValues({"Organization": Type.ORGANIZATION, "User": Type.USER});

enum Visibility { PUBLIC }

final visibilityValues = EnumValues({"public": Visibility.PUBLIC});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
