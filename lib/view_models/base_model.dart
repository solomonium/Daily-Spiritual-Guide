import '../exports.dart';

enum ViewStatus { loading, success, error }

class BaseViewModel extends ChangeNotifier {
  String? errorMessage;

  ViewStatus _status = ViewStatus.success;
  ViewStatus get viewStatus => _status;

  void clearError() {
    errorMessage = null;
  }

  void setError(e, String defaultMsg) {
    if (e is DioError) {
      final error = e.response?.data ?? {};
      if (error?.runtimeType == String) {
        errorMessage = error;
      } else if (error != null) {
        errorMessage = pick(error, 'message').asStringOrNull();
      }
    }
    errorMessage = errorMessage ?? defaultMsg;
    setStatus(ViewStatus.error);
  }

  void setStatus(ViewStatus status) {
    _status = status;
    notifyListeners();
  }
}
