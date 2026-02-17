import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  final String? initialText;

  const AddTodoPage({super.key, this.initialText});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(
      text: widget.initialText ?? "",
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final bool isEditing = widget.initialText != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Text(
                isEditing ? 'Редактировать задачу' : 'Новая задача',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),
              Container(height: 1, color: Colors.black26),
              const SizedBox(height: 18),

              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Введите текст',
                  filled: true,
                  fillColor: const Color(0xFFEDEDED),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final text = _textEditingController.text.trim();

                    if (text.isEmpty) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context, text);
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: Text(
                    isEditing ? 'Сохранить изменения' : 'Сохранить',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A72FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
