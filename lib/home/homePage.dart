import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_/add_page.dart';
import 'package:flutter_application_1/database/appDatabase.dart';
import 'package:flutter_application_1/database/todoRepository.dart';
import 'package:flutter_application_1/home/homeState.dart';
import 'package:flutter_application_1/home/homeViewModel.dart';
import 'package:flutter_application_1/home/todo_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeCubit cubit;

  @override
  void initState() {
    super.initState();

    final db = AppDatabase();
    final repo = TodorepositoryImpl(db);
    final vm = HomeViewModel(repo: repo);

    cubit = HomeCubit(vm: vm);
    cubit.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Мои задачи",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),

        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(height: 1.5, color: Colors.black26),
                      const SizedBox(height: 18),

                      Expanded(
                        child: state.isEmpty
                            ? const Center(child: Text("Пока нет задач"))
                            : ListView.separated(
                                itemCount: state.items.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final item = state.items[index];

                                  return TodoTile(
                                    title: item.title,
                                    description: item.description,
                                    dateText: item.date,

                                    onTap: () async {
                                      final result =
                                          await Navigator.push<Map<String, String>>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              AddTodoPage(todo: item),
                                        ),
                                      );

                                      if (result != null) {
                                        cubit.update(
                                          id: item.id,
                                          title: result["title"]!,
                                          description:
                                              result["description"] ?? "",
                                        );
                                      }
                                    },

                                    onDelete: () {
                                      cubit.delete(item.id);
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  right: 20,
                  bottom: 20,
                  child: FloatingActionButton(
                    onPressed: () async {
                      final result =
                          await Navigator.push<Map<String, String>>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddTodoPage(),
                        ),
                      );

                      if (result != null) {
                        cubit.save(
                          title: result["title"]!,
                          description: result["description"] ?? "",
                        );
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}