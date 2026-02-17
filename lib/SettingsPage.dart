import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = isDarkTheme ? const Color(0xFF1E1E1E) : Colors.grey[100]!;
    Color cardColor = isDarkTheme ? const Color(0xFF2C2C2C) : Colors.white;
    Color textColor = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    color: textColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Темная тема",
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Switch(
                value: isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    isDarkTheme = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
