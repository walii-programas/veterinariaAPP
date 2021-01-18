import 'package:appveterinaria/data/models/user.dart';
import 'package:appveterinaria/data/services/auth.service.dart';
import 'package:appveterinaria/pages/starPage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _pwdCtrl = TextEditingController();
  String _error;
  bool _hidePassword = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/image/logo.png')),
            Text('Ingresar'),
            SizedBox(height: 16),
            _userEntry(),
            SizedBox(height: 16),
            _pwdEntry(),
            SizedBox(height: 16),
            _error == null
                ? Text('')
                : Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: _cancelButton()),
                SizedBox(width: 16),
                Expanded(child: _submitButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _userEntry() {
    final node = FocusScope.of(context);
    return Container(
      child: TextField(
        controller: _usernameCtrl,
        onEditingComplete: node.nextFocus,
        keyboardType: TextInputType.emailAddress,
        decoration: _intpuDecoration(
          hint: 'Nombre de usuario',
          icon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _pwdEntry() {
    return Container(
      child: TextField(
        controller: _pwdCtrl,
        onEditingComplete: _login,
        obscureText: _hidePassword,
        obscuringCharacter: '*',
        keyboardType: TextInputType.text,
        decoration: _intpuDecoration(
          hint: 'Contraseña',
          icon: Icon(Icons.keyboard),
          suffixIcon: InkWell(
            onTap: () =>
                setState(() => this._hidePassword = !this._hidePassword),
            child:
                Icon(this._hidePassword ? Icons.remove_red_eye : Icons.cancel),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      child: FlatButton(
        onPressed: _login,
        color: Colors.purple,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(26.0)),
        child: Text(
          'Ingresar',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _cancelButton() {
    return Container(
      child: OutlineButton(
        onPressed: () {},
        color: Colors.purple,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(26.0)),
        child: Text(
          'Cancelar',
          style: TextStyle(
              color: Colors.purple[100],
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  InputDecoration _intpuDecoration(
      {String hint, Icon icon, Widget suffixIcon}) {
    return InputDecoration(
      enabledBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[350], width: 1),
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      focusedBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1),
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      errorBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      hintText: hint,
      filled: true,
      hintStyle: new TextStyle(color: Colors.white38),
      fillColor: Colors.white10,
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      // labelText: hint,
    );
  }

  Future<void> _login() async {
    print('U: ${this._usernameCtrl.text}, P: ${this._pwdCtrl.text}');
    AuthService service = AuthService();
    User user =
        await service.login(this._usernameCtrl.text, this._pwdCtrl.text);
    if (user == null) {
      setState(() {
        _error = 'Usuario o clave incorrecta';
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    }
  }
}
