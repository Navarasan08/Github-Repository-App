library views;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/main.dart';
import 'package:github_repos/src/constants/images.dart';
import 'package:github_repos/src/models/custom_exception.dart';
import 'package:github_repos/src/models/repository_model.dart';
import 'package:github_repos/src/services/rest_api/api_service.dart';
import 'package:github_repos/src/view_models/home_view_model.dart';
import 'package:github_repos/src/widgets/err_page.dart';
import 'package:provider/provider.dart';

// home
part './home/home_page.dart';
part './home/home_drawer.dart';

// tasks
part './tasks/task_page.dart';