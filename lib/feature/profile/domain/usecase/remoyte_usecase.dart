import 'package:brief_project/feature/profile/domain/repository/remote_repository.dart';
import 'package:http/src/response.dart';

class RemoteUsecase extends RemoteRepositoryImpl {
  RemoteRepositoryImpl remoteRepositoryImpl = RemoteRepositoryImpl();

  @override
  Future<Response> getList() {
    return remoteRepositoryImpl.getList();
  }
}
