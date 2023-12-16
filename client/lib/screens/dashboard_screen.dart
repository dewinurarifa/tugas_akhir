import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer with navigation links to other screens with menu: Dashboard, Karyawan, Kontrak, Cuti, Absensi and Logout
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: const Text('Karyawan'),
              onTap: () {
                Navigator.pushNamed(context, '/karyawan');
              },
            ),
            ListTile(
              title: const Text('Kontrak'),
              onTap: () {
                Navigator.pushNamed(context, '/kontrak');
              },
            ),
            ListTile(
              title: const Text('Cuti'),
              onTap: () {
                Navigator.pushNamed(context, '/cuti');
              },
            ),
            ListTile(
              title: const Text('Absensi'),
              onTap: () {
                Navigator.pushNamed(context, '/absensi');
              },
            ),
            ListTile(
              title: const Text('Gaji'),
              onTap: () {
                Navigator.pushNamed(context, '/gaji');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),

      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
