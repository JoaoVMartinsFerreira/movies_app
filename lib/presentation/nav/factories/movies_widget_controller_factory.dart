import 'package:movies_app/presentation/nav/controllers/movies_widget_controller.dart';
import 'package:provider/provider.dart';

final Provider<MoviesWidgetController> makeMoviesWidgetController = Provider<MoviesWidgetController>(
  create: (_) => MoviesWidgetController(),
);