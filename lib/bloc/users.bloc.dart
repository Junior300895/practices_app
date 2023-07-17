import 'package:bloc/bloc.dart';
import 'package:enset_app/model/users.model.dart';
import 'package:enset_app/repository/users.repository.dart';

abstract class UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String keywoard;
  final int page;
  final int pageSize;

  SearchUsersEvent(
      {required this.keywoard, required this.page, required this.pageSize});
}

class NextPageEvent extends UsersEvent {
  final String keywoard;
  final int page;
  final int pageSize;

  NextPageEvent(
      {required this.keywoard, required this.page, required this.pageSize});
}

abstract class UsersState {
  final List<User> users;
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final String currentKeywoard;

  UsersState({
    required this.users,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
    required this.currentKeywoard,
  });
}

class SearchUsersStateSuccessState extends UsersState {
  SearchUsersStateSuccessState(
      {required super.users,
      required super.currentPage,
      required super.totalPages,
      required super.pageSize,
      required super.currentKeywoard});
}

class SearchUsersLoadingUserState extends UsersState {
  SearchUsersLoadingUserState(
      {required super.users,
      required super.currentPage,
      required super.totalPages,
      required super.pageSize,
      required super.currentKeywoard});
}

class SearchUsersErrorState extends UsersState {
  final String errorMessage;

  SearchUsersErrorState(
      {required this.errorMessage,
      required super.users,
      required super.currentPage,
      required super.totalPages,
      required super.pageSize,
      required super.currentKeywoard});
}

class UsersInitialState extends UsersState {
  UsersInitialState()
      : super(
            users: [],
            currentPage: 0,
            totalPages: 0,
            pageSize: 20,
            currentKeywoard: "");
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersRepository usersRepository = UsersRepository();
  late UsersEvent currentEvent;

  UsersBloc() : super(UsersInitialState()) {
    on((SearchUsersEvent event, emit) async {
      currentEvent = event;
      print("search page");
      emit(SearchUsersLoadingUserState(
          users: state.users,
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          pageSize: state.pageSize,
          currentKeywoard: state.currentKeywoard));
      try {
        ListUsers listUsers = await usersRepository.searchUsers(
            event.keywoard, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount / event.pageSize).floor();
        if (listUsers.totalCount % event.pageSize != 0) {
          totalPages = totalPages + 1;
        }
        emit(SearchUsersStateSuccessState(
            users: listUsers.items,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentKeywoard: event.keywoard));
      } catch (e) {
        emit(SearchUsersErrorState(
            users: state.users,
            currentKeywoard: state.currentKeywoard,
            currentPage: state.currentPage,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            errorMessage: e.toString()));
      }
    });
    on((NextPageEvent event, emit) async {
      currentEvent = event;
      print("next page${event.page}");
      // emit(SearchUsersLoadingUserState(
      //     users: state.users,
      //     currentPage: state.currentPage,
      //     totalPages: state.totalPages,
      //     pageSize: state.pageSize,
      //     currentKeywoard: state.currentKeywoard));
      try {
        ListUsers listUsers = await usersRepository.searchUsers(
            event.keywoard, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount / event.pageSize).floor();
        if (listUsers.totalCount % event.pageSize != 0) {
          totalPages = totalPages + 1;
        }

        List<User> currentList = [...state.users];
        currentList.addAll(listUsers.items);

        emit(SearchUsersStateSuccessState(
            users: currentList,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentKeywoard: event.keywoard));
      } catch (e) {
        emit(SearchUsersErrorState(
            users: state.users,
            currentKeywoard: state.currentKeywoard,
            currentPage: state.currentPage,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            errorMessage: e.toString()));
      }
    });
  }
}
