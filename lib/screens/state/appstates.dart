// lib/screens/BNB/screens/appstates.dart
abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppBottomNavState extends AppStates {}
class GetAdvicesLoadingState extends AppStates {}
class GetAdvicesSuccessState extends AppStates {}
class GetAdvicesErrorState extends AppStates {
  final String error;
  GetAdvicesErrorState(this.error);
}
