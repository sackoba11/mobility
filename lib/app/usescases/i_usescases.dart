// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';

// import '../error/app_error.dart';
// import '../models/bus/bus.dart';
// import '../repositories/BusRepository/i_bus_repository.dart';

// abstract class IBusUsecases {
//   Future<Either<AppError, List<Bus>>> getBusRoadMap();
//   Future<Either<AppError, List<Bus>>> getAvailableBusRoadByNumber(
//       int busNumber);
// }

// @LazySingleton(as: IBusUsecases)
// class BusUsecase implements IBusUsecases {
//   final IBusRepository _busRepository;
//   BusUsecase(this._busRepository);

//   @override
//   Future<Either<AppError, List<Bus>>> getAvailableBusRoadByNumber(
//       int busNumber) {
//     return _busRepository.getBusRoadMaps();
//   }

//   @override
//   Future<Either<AppError, List<Bus>>> getBusRoadMap() {
//     return _busRepository.getBusRoadMaps();
//   }
// }
