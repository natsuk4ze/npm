import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';

const fakePackagesName = 'fakePackage';

final fakePackages = List.generate(
  10,
  (i) => Package(
    name: '$fakePackagesName $i',
    version: '$i',
    description: 'description',
    keywords: ['keyword'],
    score: Score(
      popularity: i.toDouble(),
      quality: i.toDouble(),
      maintenance: i.toDouble(),
    ),
  ),
);

Future<List<Package>> fakePackagesProvider(Ref ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return fakePackages;
}
