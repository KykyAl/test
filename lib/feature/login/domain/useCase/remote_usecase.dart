import 'package:brief_project/feature/login/data/model/response_login_model.dart';
import 'package:brief_project/feature/login/domain/repository/remote_repository.dart';
import 'package:http/http.dart' as http;

import '../../data/model/response_regis_model.dart';

class RemoteUsecase extends RemoteRepositoryImpl {
  RemoteRepositoryImpl _remoteRepositoryImpl = RemoteRepositoryImpl();
  @override
  Future<http.Response> login({ResponseLogin? body}) async {
    return _remoteRepositoryImpl.login(body: body);
  }

  @override
  Future<http.Response> regis({ResponseRegis? body}) async {
    return _remoteRepositoryImpl.regis(body: body);
  }
}
