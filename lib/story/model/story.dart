class Story {
  final String id;
  final String username;
  final String avatarURL;
  final List<String> mediaURLs;
  final bool isSeen;

  const Story({
    required this.id,
    required this.username,
    required this.avatarURL,
    required this.mediaURLs,
    this.isSeen=false,
  });
}
