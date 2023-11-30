import 'package:memodio/model/child_model.dart';
import 'package:memodio/screens/home/block/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState()) {
    onInit();
  }
  List<ChildData> childs = [];
  List<String> childStatus = ["Naughty", "Nice"];
  String? selectedStatus;

  onInit() {
    if (childs.isEmpty) {
      emit(NoDataHomeState());
    } else {
      emit(SucessHomeState(childs));
    }
  }

  setChildStatus(String status) {
    selectedStatus = status;
    emit(SucessHomeState(childs));
  }

  updatechildStatus(String status, int index) {
    childs[index].status = status;
    emit(SucessHomeState(childs));
  }

  addChildData(
      {required String name, required String country, required String status}) {
    childs.add(ChildData(name: name, country: country, status: status));
    selectedStatus = null;
    emit(SucessHomeState(childs));
  }
}
