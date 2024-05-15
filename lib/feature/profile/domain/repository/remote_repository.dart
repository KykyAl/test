import 'package:brief_project/feature/profile/data/repository/remote_repository.dart';
import 'package:http/src/response.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  RemoteRepository remoteRepository = RemoteRepository();
  @override
  Future<Response> getList() {
    return remoteRepository.getList();
  }
}
