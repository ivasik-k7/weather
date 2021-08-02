import 'package:wapp/di/repositories/repositories.dart' as repositories;
import 'package:wapp/di/singletons/singletons.dart' as singletons;

void setup() {
  repositories.init();
  singletons.init();
}
