class Format {
  const Format._();
  static String? urlFromGit(String git) {
    final index = git.indexOf('github.com');
    if (index == -1) return null;
    final url = git.substring(index);
    return 'https://$url';
  }
}
