import 'package:provider/single_child_widget.dart';

import '../exports.dart';

abstract class BaseProvider extends ChangeNotifier {}

final globalProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => AppProvider()),
];
