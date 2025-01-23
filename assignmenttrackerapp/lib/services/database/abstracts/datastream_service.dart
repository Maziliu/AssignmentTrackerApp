import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/interfaces/datastreamable.dart';

abstract class DatastreamService {
  void dispose();
  CacheStream<DatastreamObject> get cache;
}
