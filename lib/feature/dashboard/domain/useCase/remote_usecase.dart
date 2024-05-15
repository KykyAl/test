import 'package:brief_project/feature/dashboard/domain/repository/remote_repository.dart';
import 'package:http/src/response.dart';

class RemoteUseCase extends RemoteRepositoryImpl {
  RemoteRepositoryImpl _remoteRepositoryImpl = RemoteRepositoryImpl();

  @override
  Future<Response> getList() {
    return _remoteRepositoryImpl.getList();
  }
}
