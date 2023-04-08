import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

abstract class CourtRemoteDataSource {
  Future<List<CourtModel>> getCourts();
}

class CourtRemoteDataSourceImpl implements CourtRemoteDataSource {
  @override
  Future<List<CourtModel>> getCourts() async {
    try {
      final json = rootBundle.loadString('fixtures/courts.json');
      final string = await json;
      final list = jsonDecode(string) as List;
      final courts = list.map((e) => CourtModel.fromJson(e as JSON)).toList();
      return await Future.delayed(const Duration(seconds: 2), () {
        return courts;
      });
    } catch (_) {
      throw BadRequestException();
    }
  }
}
