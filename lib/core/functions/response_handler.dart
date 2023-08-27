import 'package:ecommerce/core/class/request_status.dart';

responseHandler(var response) {
  if (response is RequestStatus) {
    return response;
  } else if (response['status'] == "success") {
    return RequestStatus.success;
  } else {
    return RequestStatus.noData;
  }
}
