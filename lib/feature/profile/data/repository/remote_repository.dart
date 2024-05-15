import 'package:brief_project/feature/profile/data/datasource/remote_datasource.dart';
import 'package:http/src/response.dart';

class RemoteRepository implements RemoteDatasource {
  RemoteDatasource _remoteDatasource = RemoteDatasource();
  @override
  Future<Response> getList() {
    return _remoteDatasource.getList();
  }
}
