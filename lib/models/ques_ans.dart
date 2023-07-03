class QuesAns {
  const QuesAns(this.ques, this.ans);

  final String ques;
  final List<String> ans;

  List<String> shuffle() {
    final shuffledList = List.of(ans);
    shuffledList.shuffle();
    return shuffledList;
  }
}
