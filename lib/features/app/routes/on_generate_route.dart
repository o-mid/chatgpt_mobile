import 'package:chatgpt_mobile/features/app/app_const/page_const.dart';
import 'package:flutter/material.dart';

import '../../image_generation/presentation/pages/image_generation_page.dart';
import '../../text_completion/presentation/pages/text_completion_page.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        {
          return materialBuilder(
            widget: ErrorPage(),
          );
        }
      case PageConst.ImageGenerationPage:
        {
          return materialBuilder(
            widget: const ImageGenerationPage(),
          );
        }
      case PageConst.textCompletionPage:
        {
          return materialBuilder(
            widget: const TextCompletionPage(),
          );
        }
      default:
        return materialBuilder(
          widget: ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
