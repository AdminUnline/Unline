import 'package:flutter/material.dart';
import 'package:mvp/components/text_input_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
  });
  var editingBool = false;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profile',
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: const Icon(Icons.arrow_back))),
            body: ListView(
              children: <Widget>[
                Container(
                    height: 100,
                    decoration: BoxDecoration(),
                    child: const Icon(size: 50, Icons.account_circle_outlined)),
                Container(
                  height: 100,
                  decoration: BoxDecoration(),
                  child: TextInputWidget('username'),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(),
                  child: TextInputWidget('email'),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(),
                  child: TextInputWidget('password'),
                ),
                if (widget.editingBool) ...[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(),
                    child: TextInputWidget('Re-ender password'),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(),
                    child: TextButton(
                      style: ButtonStyle(
                          maximumSize:
                              MaterialStateProperty.all(const Size(70, 50))),
                      onPressed: () {
                        setState(() {
                          widget.editingBool = false;
                        });
                      },
                      child: Container(
                        //color: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.black, fontSize: 13.0),
                        ),
                      ),
                    )),
                ] else ...[
                  Container(
                      height: 60,
                      decoration: BoxDecoration(),
                      child: TextButton(
                        style: ButtonStyle(
                            maximumSize:
                                MaterialStateProperty.all(const Size(70, 50))),
                        onPressed: () {
                          setState(() {
                            widget.editingBool = true;
                          });
                        },
                        child: Container(
                          //color: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: const Text(
                            'Edit',
                            style:
                                TextStyle(color: Colors.black, fontSize: 13.0),
                          ),
                        ),
                      )),
                ],
                Container(
                    height: 60,
                    decoration: BoxDecoration(),
                    child: TextButton(
                      style: ButtonStyle(
                          maximumSize:
                              MaterialStateProperty.all(const Size(70, 50))),
                      onPressed: () => Navigator.pushNamed(context, '/signin-page'),
                      child: Container(
                        //color: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Colors.black, fontSize: 13.0),
                        ),
                      ),
                    )),
                Container(
                    height: 60,
                    decoration: BoxDecoration(color: Colors.red[200]),
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(color: Colors.black, fontSize: 13.0),
                        ),
                      ),
                    )),
              ],
            )));
  }
}
