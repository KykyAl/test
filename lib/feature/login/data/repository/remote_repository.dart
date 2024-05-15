import 'package:brief_project/feature/login/data/datasource/remote_datasource.dart';
import 'package:brief_project/feature/login/data/model/response_login_model.dart';
import 'package:brief_project/feature/login/data/model/response_regis_model.dart';
import 'package:http/src/response.dart';

class RemoteRepository implements RemoteDatasource {
  RemoteDatasource _remoteDatasource = RemoteDatasource();

  @override
  Future<Response> login({ResponseLogin? body}) {
    return _remoteDatasource.login(body: body);
  }

  @override
  Future<Response> regis({ResponseRegis? body}) {
    return _remoteDatasource.regis(body: body);
  }
}
