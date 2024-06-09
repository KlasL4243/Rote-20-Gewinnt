import 'package:rote20_gewinnt/src/main/bootstrap.dart';
import 'package:rote20_gewinnt/src/presentation/app/app.dart';

Future<void> main() async {
  await bootstrap(() async {
    // TODO: add repos
    return const App();
  });
}
