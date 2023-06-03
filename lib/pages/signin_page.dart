import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    super.key,
  });
  var signupBool = false;
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(17, 97, 228, 1),
                ),
                child: Center(
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                  Positioned(
                      top: 113,
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/bluedot.png'),
                                fit: BoxFit.fitWidth),
                          ))),
                  Positioned(
                      top: 316,
                      left: 271,
                      child: TextButton(
                          onPressed: () => {
                                setState(() {
                                  widget.signupBool = !widget.signupBool;
                                })
                              },
                          child: Text(
                            (() {
                              if (widget.signupBool) {
                                return "Sign In";
                              }
                              return "Sign Up";
                            })(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ))),
                  if (widget.signupBool) ...[
                    Positioned(
                        top: 347,
                        child: Container(
                            width: 234,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        245, 245, 245, 0.25999999046325684),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: const Color.fromRGBO(
                                  217, 217, 217, 0.28999999165534973),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 245, 245, 1),
                                width: 1,
                              ),
                            ))),
                    Positioned(
                        top: widget.signupBool ? 356 : 356,
                        child: const Text(
                          'Username',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: widget.signupBool ? 405 + 58 + 58 : 405,
                        child: Container(
                            width: 234,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        245, 245, 245, 0.25999999046325684),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: const Color.fromRGBO(
                                  217, 217, 217, 0.28999999165534973),
                              border: Border.all(
                                color: const Color.fromRGBO(245, 245, 245, 1),
                                width: 1,
                              ),
                            ))),
                    Positioned(
                        top: widget.signupBool ? 414 + 58 + 58 : 414,
                        child: const Text(
                          'Confirm Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ],
                  Positioned(
                      top: widget.signupBool ? 347 + 58 : 347,
                      child: Container(
                          width: 234,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      245, 245, 245, 0.25999999046325684),
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ],
                            color: const Color.fromRGBO(
                                217, 217, 217, 0.28999999165534973),
                            border: Border.all(
                              color: const Color.fromRGBO(245, 245, 245, 1),
                              width: 1,
                            ),
                          ))),
                  Positioned(
                      top: widget.signupBool ? 356 + 58 : 356,
                      child: const Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: widget.signupBool ? 405 + 58 : 405,
                      child: Container(
                          width: 234,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      245, 245, 245, 0.25999999046325684),
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ],
                            color: const Color.fromRGBO(
                                217, 217, 217, 0.28999999165534973),
                            border: Border.all(
                              color: const Color.fromRGBO(245, 245, 245, 1),
                              width: 1,
                            ),
                          ))),
                  Positioned(
                      top: widget.signupBool ? 414 + 58 : 414,
                      child: const Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                    width: 400,
                    height: 600,
                    top: 600,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 10,
                          child: Container(
                              width: 103,
                              height: 30,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: Color.fromRGBO(245, 245, 245, 1),
                              ),
                              child: TextButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/'),
                                  child: const Text(
                                    'Sign in',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(43, 56, 77, 1),
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ))),
                        ),
                        Positioned(
                            top: 50,
                            child: Container(
                                height: 25,
                                child: const Text(
                                  'Or',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ))),
                        Positioned(
                          top: 75,
                          child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: Stack(children: const <Widget>[
                                Positioned(
                                    top: 2,
                                    left: 2.0299999713897705,
                                    child: Text('G')),
                              ])),
                        )
                      ],
                    ),
                  ),
                ])))));
  }
}
