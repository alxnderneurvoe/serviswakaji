import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../model/note.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingInitial());

  showLoading(BuildContext context, String message, bool isDismissible) async =>
      await showProgress(context, message, isDismissible);

  hideLoading() async => await hideProgress();
}

@immutable
abstract class LoadingState {}

class LoadingInitial extends LoadingState {}
