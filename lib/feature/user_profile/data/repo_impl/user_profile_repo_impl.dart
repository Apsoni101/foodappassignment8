

import 'package:foodappassignment8/feature/user_profile/data/data_source/user_profile_local_data_source.dart';
import 'package:foodappassignment8/feature/user_profile/domain/entity/user_profile.dart';
import 'package:foodappassignment8/feature/user_profile/domain/repo/user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final UserProfileLocalDataSource localDataSource;

  UserProfileRepoImpl({required this.localDataSource});

  @override
  UserProfileEntity getUser() => localDataSource.getUserProfile();

  @override
  void updateUser(UserProfileEntity user) {
    localDataSource.updateUserProfile(user);
  }
  @override
  void clearUserProfile() {
    localDataSource.clearUserProfile();
  }
}
