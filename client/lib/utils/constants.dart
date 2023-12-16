import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

var myDrawer = Drawer(
  backgroundColor: Colors.blueGrey,
  child: Column(children: const [
    DrawerHeader(
        child: Icon(
      Icons.favorite,
      color: Colors.white,
    )),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.white,
      ),
      title: Text(
        'D A S H B O A R D',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.account_circle_sharp,
        color: Colors.white,
      ),
      title: Text(
        'D A T A  P E G A W A I',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.book,
        color: Colors.white,
      ),
      title: Text(
        'D A T A  A B S E N S I',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.attach_money,
        color: Colors.white,
      ),
      title: Text(
        'G A J I',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.ballot,
        color: Colors.white,
      ),
      title: Text(
        'K O N T R A K  K E R J A',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.calendar_month,
        color: Colors.white,
      ),
      title: Text(
        'D A T A  C U T I',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      title: Text(
        'L O G O U T',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ]),
);
