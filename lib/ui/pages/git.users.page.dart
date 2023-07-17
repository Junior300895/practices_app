import 'package:enset_app/bloc/users.bloc.dart';
import 'package:enset_app/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTextController = TextEditingController();
    return Scaffold(
        // drawer: const MainDrawer(), PAS BESOIN
        appBar: AppBar(
          title: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is SearchUsersStateSuccessState) {
                return Row(
                  children: [
                    const Text("Users"),
                    Text("${state.currentPage}/${state.totalPages}")
                  ],
                );
              } else {
                return const Text("Users Page");
              }
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<UsersBloc>().add(SearchUsersEvent(
                          keywoard: searchTextController.text,
                          page: 0,
                          pageSize: 20));
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
              if (state is SearchUsersLoadingUserState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchUsersErrorState) {
                return Column(
                  children: [
                    Text(
                      state.errorMessage,
                      style: CustomTheme.errorTextStyle,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          UsersBloc userBloc = context.read<UsersBloc>();
                          userBloc.add(userBloc.currentEvent);
                        },
                        child: const Text("Retry"))
                  ],
                );
              } else if (state is SearchUsersStateSuccessState) {
                return Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () {
                      context.read<UsersBloc>().add(NextPageEvent(
                          keywoard: state.currentKeywoard,
                          page: state.currentPage + 1,
                          pageSize: state.pageSize));
                    },
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          state.users[index].avatarUrl),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.users[index].login,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  child: Text("${state.users[index].score}"),
                                )
                              ],
                            ),
                            // trailing: CircleAvatar(
                            //   child:
                            //       Text("${state.listUsers.items[index].score}"),
                            // ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 2,
                          );
                        },
                        itemCount: state.users.length),
                  ),
                );
              } else {
                return Container();
              }
            })
          ],
        ));
  }
}
