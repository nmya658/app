import 'package:flutter_bloc/flutter_bloc.dart';
import 'appstates.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<dynamic> highCentersList = [
    {
      "center": {
        "centerName": "Autism Center A",
        "address": "Dubai",
        "center_photo": "",
      },
      "validation": 4
    },
    {
      "center": {
        "centerName": "Bright Future Center",
        "address": "Abu Dhabi",
        "center_photo": "",
      },
      "validation": 5
    }
  ];

  void changeBottomNavBar(int index) {}
}
