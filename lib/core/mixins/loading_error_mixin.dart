import 'package:flutter/widgets.dart';

mixin LoadingErrorMixin<T extends StatefulWidget> on State<T> {
  bool isLoading  = true;
  String? errorMesssage;
  void setIsLoading(bool newIsLoading){
    setState(() {
      isLoading = newIsLoading;
    });
  }
  void setError(String? newErrorMessage){
    setState(() {
      errorMesssage = newErrorMessage;
    });
  }
}