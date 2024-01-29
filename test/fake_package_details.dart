import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';

const fakePackageDetailsName = 'fakePackageDetails';

const fakePackageDetails = PackageDetails(
  name: fakePackageDetailsName,
  license: 'MIT',
  homepage: 'https://homepage',
  readme: null,
  repository: 'git+https://repository',
);

Future<PackageDetails> fakePackageDetailsProvider(Ref ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return fakePackageDetails;
}
