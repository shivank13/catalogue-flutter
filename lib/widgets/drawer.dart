import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final imageUrl="https://media-exp1.licdn.com/dms/image/C5603AQFkTtVyQAfwdg/profile-displayphoto-shrink_800_800/0/1590680933096?e=1627516800&v=beta&t=dO5Khkb5nxDrCBWuMs03DqeOmPMRBoYEg6TLg_UM9wM";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
         child: ListView(
          children:[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Shivank Sharma"),
                accountEmail: Text("Shivanksharma013@gmail.com"),
                 currentAccountPicture: CircleAvatar(
                   backgroundImage: NetworkImage(imageUrl),
                 ),
              ) ,
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home,
                color:Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor:1.2,
                  style: TextStyle(
                     color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.profile_circled,
                color:Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor:1.2,
                  style: TextStyle(
                     color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.mail,
                color:Colors.white,
                ),
                title: Text(
                  "Shivanksharma013@gmail.com",
                  textScaleFactor:1.2,
                  style: TextStyle(
                     color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}