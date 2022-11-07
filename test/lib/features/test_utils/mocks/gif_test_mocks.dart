import 'package:mocktail/mocktail.dart';
import 'package:summer_app/features/gifs/data/data_source/gifs_remote_data_source.dart';
import 'package:summer_app/features/gifs/domain/repositories/get_data_gifs_contract.dart';

class GifsRemoteDatasourceMock extends Mock implements GifsRemoteDatasource {}

class GifsDataContractMock extends Mock implements GifsDataContract {}
