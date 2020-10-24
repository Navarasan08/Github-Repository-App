

import 'package:intl/intl.dart';

class RestApi {

  RestApi() {
    DateTime now = DateTime.now();
    var prevMonth = new DateTime(now.year, now.month - 1, now.day);
    String formattedDate = DateFormat('yyyy-MM-dd').format(prevMonth);
    setRepos = formattedDate;
  }

  String baseUrl = "https://api.github.com/";

  String _repos;
  get repos => _repos;
  set setRepos(String date) => _repos = baseUrl + "search/repositories?q=created:&gt;$date&amp;sort=stars&amp;order=desc";

}