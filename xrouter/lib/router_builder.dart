import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'gen.dart';

Builder mybuilder(BuilderOptions options) =>
    SharedPartBuilder([SecondGenerator()], "resource_metadata_other");
