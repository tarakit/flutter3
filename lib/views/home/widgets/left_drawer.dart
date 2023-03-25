import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .82,
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              // currentAccountPictureSize: Size.fromRadius(35),
              currentAccountPicture: ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(150)),
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2020/05/11/11/23/woman-5157666__340.jpg',
                    fit: BoxFit.cover,
                  )),
              accountName: const Text(''),
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Tara Kit'),
                      Text('Personal Account'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          foregroundColor:
                          MaterialStateProperty.all(Colors.white),
                          side: MaterialStateProperty.all(const BorderSide(
                              width: 1, color: Colors.white)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10)))),
                      child: const Text('Switch'),
                    ),
                  )
                ],
              ),
            ),
            // Divider(height: 5, color: Colors.blue,),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Helps'),
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text('About Us'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Helps'),
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text('About Us'),
            ),
            Divider(
              height: 5,
              color: Colors.blue,
            ),
            ListTile(
              title: Text('Settings'),
            ),
            ListTile(
              title: Text('Terms & Condtitions'),
            ),
            ListTile(
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
