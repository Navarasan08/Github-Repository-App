import 'package:flutter/material.dart';
import 'package:github_repos/src/constants/images.dart';
import 'package:github_repos/src/models/custom_exception.dart';
import 'package:github_repos/src/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class ErrPage extends StatelessWidget {
  final CustomException exception;

  const ErrPage({Key key, @required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(exception);

    if (exception.type != CustomExceptionType.noInternet) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MyImages.error404,
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              exception.exception,
              style: TextStyle(fontSize: 19.0),
            ),
          ],
        ),
      );
    }
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(exception.exception, style: TextStyle(fontSize: 19.0)),
        SizedBox(height: 20.0),
        // RaisedButton(
        //   child: Text("click to Reload"),
        //   textColor: Colors.white,
        //   color: Colors.green,
        //   onPressed: () => Provider.of<HomeViewModel>(context).getRepos(),
        // ),
      ],
    ));
  }
}
