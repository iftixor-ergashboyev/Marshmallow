import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:marshmallow/data/network/api_service.dart';
import 'package:marshmallow/domain/repository/love_repository.dart';
import '../model/love_random.dart';

class LoveRepositoryImpl extends LoveRepository {
  final ApiService apiService;
  LoveRepositoryImpl(this.apiService); // dependency inversion

  @override
  Future<LoveRandom?> getRandom(String boyName, String girlName) async {
    try {
      // with ur internet
      // final number = await apiService.getLoveRandom();

      // offline
      final number = Random().nextInt(100);
      return LoveRandom(random: number);
    } catch(e) {
      debugPrint("@@@$e");
      return null;
    }
  }
}