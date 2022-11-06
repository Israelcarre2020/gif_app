import 'package:flutter/material.dart';

class ListGifPage extends StatefulWidget {
  const ListGifPage({super.key});

  @override
  State<ListGifPage> createState() => _ListGifPageState();
}

class _ListGifPageState extends State<ListGifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gif App'),
      ),
      body: const Center(
        child: Text('Iniciamos !!!'),
      ),
    );
  }
}
