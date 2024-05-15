import 'package:brief_project/feature/login/data/model/response_login_model.dart';
import 'package:brief_project/feature/login/data/model/response_regis_model.dart';
import 'package:http/src/response.dart';

import '../../../login/data/repository/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  RemoteRepository remoteRepository = RemoteRepository();

  @override
  Future<Response> login({ResponseLogin? body}) {
    return remoteRepository.login(body: body);
  }

  @override
  Future<Response> regis({ResponseRegis? body}) {
    return remoteRepository.regis(body: body);
  }
}
