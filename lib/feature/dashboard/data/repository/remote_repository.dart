import 'package:http/src/response.dart';

import '../datasource/remote_datasource.dart';

class RemoteRepository implements RemoteDataSource {
  RemoteDataSource _remoteDatasource = RemoteDataSource();

  @override
  Future<Response> getList() {
    return _remoteDatasource.getList();
  }
}
