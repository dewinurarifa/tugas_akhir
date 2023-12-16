import 'package:client/screens/absensi/home_absensi_screen.dart';
import 'package:client/screens/cuti/home_cuti_screen.dart';
import 'package:client/screens/dashboard_screen.dart';
import 'package:client/screens/gaji/home_gaji_screen.dart';
import 'package:client/screens/karyawan/home_karyawan_screen.dart';
import 'package:client/screens/kontrak/home_kontrak_screen.dart';
import 'package:client/screens/login_screen.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/karyawan': (context) => const HomeKaryawanScreen(),
        '/kontrak': (context) => const HomeKontrakScreen(),
        '/cuti': (context) => const HomeCutiScreen(),
        '/gaji': (context) => const HomeGajiScreen(),
        '/absensi': (context) => const HomeAbsensiScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter AQUAROOM',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const LoginScreen(),
    );
  }
}
