
import 'package:dartz/dartz.dart';
import 'package:foodappassignment8/core/networking/network_failure.dart';
import 'package:foodappassignment8/feature/food_listing/domain/entity/food_item_entity.dart';

abstract class FoodItemDetailRepo{
  Future<Either<NetworkFailure,FoodItemEntity>> getFoodItem(int id );
}