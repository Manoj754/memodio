import 'package:memodio/model/child_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class NoDataHomeState extends HomeState {}

class SucessHomeState extends HomeState {
  List<ChildData> childs;
  SucessHomeState(this.childs);
}
