import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeMapState extends Model {
  static HomeMapState of(BuildContext context) =>
      ScopedModel.of<HomeMapState>(context);

  bool isLoading;

  HomeMapState({this.isLoading = true});

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }
  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

}