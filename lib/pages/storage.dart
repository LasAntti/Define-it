import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StoragePage extends StatefulWidget {
   const StoragePage({super.key}); 

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final _storedWords = Hive.box('storedWords');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Stored words',
        ),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
             for (var i = 0; i < _storedWords.length; i++)
              Card(
                child: ListTile(
                  title: Text(_storedWords.getAt(i).toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () {
                      setState(() {
                        _storedWords.deleteAt(i);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Word deleted'),
                        ),
                      );
                    },
                  )
                ),
              ),
          ],
        ),
      ),
    );
  }
}
