

import 'package:foodappassignment8/feature/user_profile/domain/entity/user_profile.dart';
import 'package:foodappassignment8/feature/user_profile/domain/repo/user_profile_repo.dart';

class UserProfileUseCase {
  final UserProfileRepo repo;

  UserProfileUseCase({required this.repo});

  UserProfileEntity getUserProfile() {
    return repo.getUser();
  }

  void updateUserProfile(UserProfileEntity profile) {
    repo.updateUser(profile);
  }

  void clearUserProfile() {
    repo.clearUserProfile();
  }
}
