import 'package:define_it/utility/router.dart' as route;
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  //Navigator.pushNamed(context,secondPage);

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    const String drawerImage =
        'https://images.unsplash.com/photo-1674511564261-4cda0b8ac9f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
    const String backgroundImage =
        'https://images.unsplash.com/photo-1559291001-693fb9166cba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80';
    
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Define it',
        ),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    drawerImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Navigation',
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            ListTile(
              leading: const Icon(
                color: Colors.cyanAccent,  
                Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                color: Colors.cyanAccent,
                Icons.storage),
              title: const Text('Stored Quotes'),
              onTap: () => Navigator.pushNamed(context, route.storagePage),
            ),
            ListTile(
              leading: const Icon(
                color: Colors.cyanAccent,
                Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pushNamed(context, route.settingsPage),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImage // Vino Li
                ),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        Center(
        child: 
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, route.getWordsPage),
          child: const Text('Define a word'),
        ),
        ), 
      ),
        ],
      ),
    );
  }
}


