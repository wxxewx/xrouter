import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'gen.dart';

Builder routerBuilder(BuilderOptions options) =>
    SharedPartBuilder([RouterGenerator()], "resource_metadata_other");
