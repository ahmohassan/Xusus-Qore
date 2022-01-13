import 'package:flutter/material.dart';

class NavgicationSlide extends StatelessWidget {
  const NavgicationSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[400],
        child: Column(
          children: [
            Container(
              child: Row(children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.facebook))
              ],),
            )
          ],
        ),
      ),
    );
  }
}
