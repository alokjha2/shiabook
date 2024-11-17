import 'dart:io';
import 'package:yaml/yaml.dart';

void main() async {
  // Get the plugins from pubspec.lock instead
  final pubspecLock = File('pubspec.lock');
  if (!pubspecLock.existsSync()) {
    print('No pubspec.lock found');
    return;
  }

  // Use the correct loadYaml function from the yaml package
  final YamlMap yamlMap = loadYaml(pubspecLock.readAsStringSync());

  // Convert YamlMap to Map<String, dynamic>
  final Map<String, dynamic> lockContent = Map<String, dynamic>.from(yamlMap);

  final pluginsPath = Directory('build/host/outputs/.pub-cache/hosted/pub.dev');

  // Process each package in pubspec.lock
  for (var package in lockContent['packages'].keys) {
    final pluginDir = Directory('${pluginsPath.path}/$package/android');
    if (!pluginDir.existsSync()) continue;

    final buildGradleFile = File('${pluginDir.path}/build.gradle');
    if (!buildGradleFile.existsSync()) {
      print('No build.gradle found for $package');
      continue;
    }

    String content = buildGradleFile.readAsStringSync();

    // Extract package name from AndroidManifest.xml
    final manifestFile = File('${pluginDir.path}/src/main/AndroidManifest.xml');
    if (!manifestFile.existsSync()) {
      print('No AndroidManifest.xml found for $package');
      continue;
    }

    String manifestContent = manifestFile.readAsStringSync();
    final packageRegex = RegExp(r'package="([^"]+)"');
    final match = packageRegex.firstMatch(manifestContent);
    if (match == null) {
      print('No package name found in AndroidManifest.xml for $package');
      continue;
    }

    final packageName = match.group(1);

    // Add namespace if not present
    if (!content.contains('namespace')) {
      content = content.replaceFirst(
        'android {',
        'android {\n    namespace "$packageName"'
      );
      buildGradleFile.writeAsStringSync(content);
      print('Added namespace to $package');
    } else {
      print('Namespace already exists in $package');
    }
  }
}
