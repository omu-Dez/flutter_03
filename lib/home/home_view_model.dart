import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/todorepository.dart';
import 'package:flutter_application_1/home/home_state.dart';
import 'package:flutter_application_1/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeViewModel {
  final TodoRepository repo;
  HomeViewModel({required this.repo});

  Future<List<Todo>> fethList() => repo.getList();
}
class HomeCubit extends Cubit<HomeState>{
  final HomeViewModel vm;
  HomeCubit ({required this.vm}): super(HomeState.initial());
  Future<void> fetchList() async {
    try{
      final items = await vm.fethList();
      if (items.isEmpty) {
        emit(state.copyWith(items: [], isEmpty: true ));
      }else{
        emit(state.copyWith(items: items, isEmpty: false));
      }
      
    }catch (e) {

    }
  }
}