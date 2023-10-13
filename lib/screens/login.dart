import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_project/screens/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _textcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//backgroundColor: Color.fromARGB(255, 84, 134, 179),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text(
                    'Your  Phone  Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please confirm your country code \n and enter your mobile phone number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: TextEditingController(text: ' India'),
                    decoration: InputDecoration(
                        prefix: const Icon(Icons.flag),
                        label: const Text(
                          'Country',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        suffixIcon: const Icon(Icons.arrow_forward_ios),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                  ),
                  const SizedBox(
                    height: 20
                  ),
                  TextFormField(
                    controller: _textcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefix: const Text(
                          '+91',
                        ),
                        label: const Text('Phone number',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
      
                        )),
                     validator: (value) {
                       if (value == null || value.isEmpty){
                        return 'please enter a  phone number';
              
                       }
                       else if(value.length !=10){
                        return 'phone number must be 10 digits';
                       }
                       return null;
                     },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label:  const Text('password', style: TextStyle(fontSize: 15)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                       validator:(value) {
                         if(value == null || value.isEmpty){
                          return'please enter a password';
      
                         }else if(value.length !=5) {
                          return 'password must be 5 characters';
                         }
                         return null;
                       },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(_formKey.currentState!.validate()) {
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            await sharedPreferences.setBool('islogin', true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
          }
        
        ;
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
