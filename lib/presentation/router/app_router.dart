import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/screen/reels/reels.dart';
import 'package:instagram_clone/presentation/screen/search/search.dart';
import 'package:instagram_clone/presentation/screen/uploadPost/uploadPost.dart';
import '../screen/authentication/authentication_page.dart';
import '../screen/home/homePage.dart';
import '../screen/profile/Profile.dart';
import '../widgets/customNavigationBar.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthenticationPage());
      case '/customBottonNaviBar':
        return MaterialPageRoute(builder: (_) => CustomBottonNaviBar());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/profilePage':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/reelsPage':
        return MaterialPageRoute(builder: (_) => ReelsPage());
      case '/searchPage':
        return MaterialPageRoute(builder: (_) => SearchPage());
      case '/uploadPostPage':
        return MaterialPageRoute(builder: (_) => UploadPostPage());
      // case '/addNote':
      //   Map<String, dynamic> routeArguments =
      //       settings.arguments as Map<String, dynamic>;
      //   QuillController quillController =
      //       routeArguments['quillController'] ?? QuillController.basic();
      //   return MaterialPageRoute(
      //       builder: (_) => AddNote(
      //             quillController: quillController,
      //           ));

      // case '/challenge-details':
      //   Map<String, dynamic> routeArguments =
      //   settings.arguments as Map<String, dynamic>;
      //   Contest contest = routeArguments['contest'] as Contest;
      //   bool completed = routeArguments['boolValue'] as bool;
      //   return MaterialPageRoute(
      //       builder: (_) => ContestDetails(
      //         contest: contest,
      //         completed: completed,
      //       ));
      // case '/play-challenge':
      //   dynamic args = settings.arguments;
      //   Contest contest = args['contest'];
      //   List<ChallengeStep> steps = args['steps'];
      //   return MaterialPageRoute(
      //       builder: (_) => PlayContest(steps: steps, contest: contest));
      default:
        return null;
    }
  }
}
