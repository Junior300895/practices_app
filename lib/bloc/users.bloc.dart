import 'package:bloc/bloc.dart';
import 'package:enset_app/model/users.model.dart';
import 'package:enset_app/repository/users.repository.dart';

abstract class UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String keywoard;

  SearchUsersEvent({required this.keywoard});
}

abstract class UsersState {}

class SearchUsersStateSuccessState extends UsersState {
  final ListUsers listUsers;

  SearchUsersStateSuccessState({required this.listUsers});
}

class SearchUsersLoadingUserState extends UsersState {}

class SearchUsersErrorState extends UsersState {
  final String errorMessage;

  SearchUsersErrorState({required this.errorMessage});
}

class UsersInitialState extends UsersState {}

class UsersBloc extends Bloc<SearchUsersEvent, UsersState> {
  UsersRepository usersRepository = UsersRepository();
  UsersBloc() : super(UsersInitialState()) {
    on((SearchUsersEvent event, emit) async {
      emit(SearchUsersLoadingUserState());
      try {
        ListUsers listUsers =
            await usersRepository.searchUsers(event.keywoard, 0, 20);
        emit(SearchUsersStateSuccessState(listUsers: listUsers));
      } catch (e) {
        emit(SearchUsersErrorState(errorMessage: e.toString()));
      }
    });
  }
}
