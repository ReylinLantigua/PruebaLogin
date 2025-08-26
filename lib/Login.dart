import 'package:applogin/main.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key, required this.title});


  final String title;

  @override
  State<MyLogin> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLogin> {

  final _email = TextEditingController();
  final _pass = TextEditingController();

  // ignore: unused_element
  void _login(){
    String email = _email.text;
    String pass = _pass.text;
    
    if (email == "rey@gmail.com" && pass == "1234") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Home",)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Credenciales Incorrectas")));
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Principal"),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(labelText: "Gmail de usuario"),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if (value == null || value.isEmpty ) {
                  return "Ingrese un correo";
                }
                return null;
              },
            ),
            SizedBox(height: 5),

            TextFormField(
              controller: _pass,
              decoration: InputDecoration(labelText: "Contraseña de usuario"),
              obscureText: true,
              
              validator: (value){
                if (value == null || value.isEmpty ) {
                  return "Ingrese su contraseña";
                }
                return null;
              },
            ),
            SizedBox(height: 5),

            ElevatedButton(
              onPressed: _login, 
              child: Text("Iniciar Sesión"))
          ],
        ),
      ),
    );
  }
}