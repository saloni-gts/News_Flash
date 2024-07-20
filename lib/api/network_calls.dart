
import 'package:http/http.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final client = Client();

class NetworkCalls {
    Future<String> get(String url) async {
// initConnectivity();

    bool checkConn = await checkInternet();
    print("checking connectionnnn$checkConn");

 

    if (checkConn) {
      return await client.get(Uri.parse(url), ).then((response) async {
        print("checking status code===== ${response.statusCode}");
      
        return response.body;
      });
    } else {
      return "";
    }
    
  }
  
Future checkInternet() async {
  bool result = await InternetConnectionChecker().hasConnection;
  print("result while call fun $result");
  if (result == false) {
    Future.delayed(const Duration(seconds: 1), () async {
      await EasyLoading.showToast("Internet Not Connected", toastPosition: EasyLoadingToastPosition.bottom);
    });
    return result;
  
  } else {}
  return result;
}

}