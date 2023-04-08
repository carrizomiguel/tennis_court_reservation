import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';

abstract class CourtRepository {
  Future<Result<List<CourtModel>, Failure>> getCourts();
}

class CourtRepositoryImpl implements CourtRepository {
  CourtRepositoryImpl({
    required this.remoteDataSource,
  });

  final CourtRemoteDataSource remoteDataSource;

  @override
  Future<Result<List<CourtModel>, Failure>> getCourts() async {
    try {
      final remote = await remoteDataSource.getCourts();
      return Result.ok(remote);
    } on BadRequestException {
      return Result.err(BadRequestFailure());
    }
  }
}
