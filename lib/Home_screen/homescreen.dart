import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> todos = ['Make an App'];
  List<String> titles = ['Flutter'];
  List tasksNo = [1];

  TextEditingController addTodoController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController titleUpdateController = TextEditingController();
  TextEditingController todosUpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 152, 182, 206),
        title: const Row(
          children: [
            Text('Todo App'),
            Spacer(),
            CircleAvatar(
              child: Icon(
                Icons.person,
                color: Color.fromARGB(255, 9, 71, 116),
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        width: 250,
        shadowColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 231, 236, 240),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                // border: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Search...',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 25, left: 18, bottom: 5),
            child: Text(
              'All ToDos',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 9, 71, 116)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 152, 182, 206),
                    child: Text(
                      tasksNo[index].toString(),
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 9, 71, 116)),
                    ),
                  ),
                  title: Text(
                    titles[index],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  subtitle: Text(
                    todos[index],
                    style: TextStyle(color: Colors.black54),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {
                            titleUpdateController.text = titles[index];
                            todosUpdateController.text = todos[index];
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Edit Todo'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: titleUpdateController,
                                        ),
                                        TextFormField(
                                          controller: todosUpdateController,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            titles[index] =
                                                titleUpdateController.text;
                                            todos[index] =
                                                todosUpdateController.text;
                                            todosUpdateController.clear();
                                            titleUpdateController.clear();
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Update'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            setState(() {
                              titles.removeAt(index);
                              todos.removeAt(index);
                            });
                          },
                          child: const Icon(Icons.done)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter the Title',
                            hintStyle: TextStyle(color: Colors.black38)),
                        controller: titleController),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter the Todo',
                          hintStyle: TextStyle(color: Colors.black38)),
                      controller: addTodoController,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todos.add(addTodoController.text);
                        titles.add(titleController.text);
                        tasksNo.add(tasksNo.last + 1);
                        addTodoController.clear();
                        titleController.clear();
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('ADD'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
