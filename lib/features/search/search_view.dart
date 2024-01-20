import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  hintText: "Search",
                  border: buildOutlineInputBorder(),
                  enabledBorder: buildOutlineInputBorder(),
                  disabledBorder: buildOutlineInputBorder(),
                  focusedBorder: buildOutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
