import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

class SecondGenerator extends GeneratorForAnnotation<XRouter> {
  @override
  FutureOr<String?> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final List<ClassElement> classes =
        await _getAnnotatedClasses(element.library);

    final StringBuffer buffer = StringBuffer();
    final StringBuffer importBuffer = StringBuffer();
    final StringBuffer variablesBuffer = StringBuffer();
    final StringBuffer methodBuffer = StringBuffer();

    importBuffer.writeln("import 'package:flutter/material.dart';");
    importBuffer.writeln("import 'package:flutter/cupertino.dart';");
    importBuffer.writeln("import 'package:flutter/widgets.dart';");
    for (var element in classes) {
      // 如果不是类，则跳过
      if (element is! ClassElement) {
        continue;
      }
      // 获取 GenerateToFile 注解对象
      final annotation =
          const TypeChecker.fromRuntime(XRouter).firstAnnotationOf(element);
      if (annotation == null) {
        continue;
      }
      // 获取注解参数
      final name = annotation.getField('name')?.toStringValue();
      final path = annotation.getField('path')?.toStringValue();
      final description = annotation.getField('description')?.toStringValue();
      final theme = annotation.getField('theme')?.toString() ?? "";
      final showCates = annotation.getField('showCate')?.toListValue() ?? [];
      String packagePath = element.library.source.uri.toString();
      importBuffer.writeln("import '$packagePath';");

      variablesBuffer
          .writeln('static String  ${name}_page = \'$path\'; // $description');

      if (element.constructors.length > 1) {
        throw Exception("page ${element.name} has more than one constructor");
      }
      if (element.constructors.length == 0) {
        throw Exception("page ${element.name} has no constructor");
      }

      showCates.forEach((showCate) {
        var cate = ShowCate.Page;
        var cateName = "Page";
        if (showCate.toString().contains("Page")) {
          cate = ShowCate.Page;
          cateName = "Page";
        } else if (showCate.toString().contains("Dialog")) {
          cate = ShowCate.Dialog;
          cateName = "Dialog";
        } else if (showCate.toString().contains("BottomSheet")) {
          cate = ShowCate.BottomSheet;
          cateName = "BottomSheet";
        }
        var methonParams = "";
        var methonParams2 = "";
        for (var constructor in element.constructors) {
          var hasChoosable = false;
          for (var parameter in constructor.parameters) {
            if (!hasChoosable && parameter.toString().startsWith("{")) {
              hasChoosable = true;
              methonParams += "{";
            }
            methonParams +=
                "${parameter.toString().replaceAll("{", "").replaceAll("}", "")},";
            if (parameter.toString().startsWith("{")) {
              methonParams2 += "${parameter.name}:${parameter.name},";
            } else {
              methonParams2 += "${parameter.name},";
            }
            var parameterpk =
                parameter.type.element?.library?.source.uri.toString();
            importBuffer.writeln("import '$parameterpk';");
          }
          if (hasChoosable) {
            methonParams += "}";
          }
        }

        if (methonParams.length > 0) {
          if (methonParams.endsWith("}")) {
            methonParams = methonParams.substring(0, methonParams.length - 2);
            methonParams += "}";
          } else {
            methonParams = methonParams.substring(0, methonParams.length - 1);
          }
        }
        if (methonParams2.length > 0) {
          methonParams2 = methonParams2.substring(0, methonParams2.length - 1);
        }

        var pageName = element.name
            .replaceAll("Page", "")
            .replaceAll("page", "")
            .replaceAll("Dialog", "")
            .replaceAll("dialog", "")
            .replaceAll("BottomSheet", "")
            .replaceAll("bottomSheet", "");
        var routerCateName = theme.contains("Material")
            ? "MaterialPageRoute"
            : "CupertinoPageRoute";
        if (cate == ShowCate.Dialog) {
          methodBuffer.writeln('''
  Future open${pageName}$cateName(BuildContext context${methonParams != "" ? ',$methonParams' : ""}) {
    return show${theme.contains("Material") ? "" : "Cupertino"}Dialog(
        context: context,
        builder: (context) => ${element.name}(${methonParams2}),
        routeSettings: RouteSettings(name: ${name}_page),
            );
  }''');
        }
        if (cate == ShowCate.BottomSheet) {
          methodBuffer.writeln('''
  Future open${pageName}$cateName(BuildContext context${methonParams != "" ? ',$methonParams' : ""}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => ${element.name}(${methonParams2}),
      routeSettings: RouteSettings(name: ${name}_page),
    );
  }''');
        }
        if (cate == ShowCate.Page) {
          methodBuffer.writeln('''
  Future open${pageName}$cateName(BuildContext context${methonParams != "" ? ',$methonParams' : ""}) {
    return Navigator.of(context).push($routerCateName(
      builder: (context) => ${element.name}(${methonParams2}),
      settings: RouteSettings(name: ${name}_page),
    ));
  }''');
        }
      });
    }
    var dir = Directory("lib//router/");
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    final file = File('lib/router/router.dart'); // 文件路径
    buffer.writeln(importBuffer.toString());
    buffer.writeln("\n");
    buffer.writeln("class Router {");
    buffer.writeln(variablesBuffer.toString());
    buffer.writeln("\n");
    buffer.writeln(methodBuffer.toString());
    buffer.writeln("}");
    file.writeAsStringSync(buffer.toString()); // 将文件内容写入文件
    return null;
  }

  Future<List<ClassElement>> _getAnnotatedClasses(
      LibraryElement? library) async {
    final List<ClassElement> classes = <ClassElement>[];
    await library?.accept(_GenerateToFileVisitor(classes));
    return classes;
  }
}

class _GenerateToFileVisitor extends RecursiveElementVisitor<Null> {
  _GenerateToFileVisitor(this.classes);

  final List<ClassElement> classes;

  @override
  Null visitClassElement(ClassElement element) {
    final annotation = element.metadata
        .map((m) => m.computeConstantValue())
        .whereType<XRouter>()
        .map((obj) => obj); // 进行类型转换

    if (annotation != null) {
      classes.add(element);
    }
    return super.visitClassElement(element);
  }
}
