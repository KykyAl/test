import 'package:http/src/response.dart';

import '../../data/repository/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  RemoteRepository _repository = RemoteRepository();

  @override
  Future<Response> getList() {
    return _repository.getList();
  }
}
