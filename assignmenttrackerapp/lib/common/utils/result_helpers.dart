import 'package:assignmenttrackerapp/common/utils/result.dart';

K extractOrThrow<K>({required Result result, required Exception throwIfFail}) {
  switch (result) {
    case Ok():
      return result.value;
    case Error():
      throw throwIfFail;
  }
}
