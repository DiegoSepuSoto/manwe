import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/authentication_repository.dart';
import 'package:manwe/src/domain/blocs/authentication/login_cubit.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isObscured = true;

  final authenticationRepository = new AuthenticationRepositoryImplementation();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) =>
          LoginCubit(authenticationRepository: authenticationRepository),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if(!state.isSubmitting && state.isSuccess && !state.isFailed) {
            Navigator.pushReplacementNamed(context, "home");
          } else if(!state.isSubmitting && !state.isSuccess && state.isFailed) {
            _showSnackBar(context, "No se pudo ingresar a la aplicación");
          }
        },
        child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding * 2,
              right: kDefaultPadding * 2,
            ),
            height: size.height * 0.45,
            child: Column(
              children: [
                loginFormHeader(),
                Spacer(),
                emailInput(),
                Spacer(),
                passwordInput(),
                Spacer(),
                termsAndConditions(),
                Spacer(),
                Spacer(),
                loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginFormHeader() {
    return Container(
      child: Text(
        "Ingresa con tus credenciales de Pasaporte.UTEM",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget emailInput() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: _emailFocusNode,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            _emailFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 3.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 1.5,
              ),
            ),
            hintText: 'Ingresa tu correo UTEM',
          ),
          validator: (value) =>
              !state.isEmailValid ? "Este no es un correo válido!" : null,
          onChanged: (value) =>
              context.read<LoginCubit>().emailChanged(email: value),
        );
      },
    );
  }

  Widget passwordInput() {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return TextFormField(
        focusNode: _passwordFocusNode,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) {
          _passwordFocusNode.unfocus();
        },
        obscureText: _isObscured,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 3.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 1.5,
            ),
          ),
          suffixIcon: InkWell(
            onTap: _togglePasswordObscured,
            child: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Ingresa tu contraseña',
        ),
        onChanged: (value) =>
            context.read<LoginCubit>().passwordChanged(password: value),
      );
    });
  }

  Widget termsAndConditions() {
    return InkWell(
      onTap: _launchTermsAndConditions,
      child: Text(
        "Ver términos y condiciones",
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
    );
  }

  Widget loginButton() {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return !state.isSubmitting
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "Ingresar",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginCubit>().loginStarted();
                }
              },
            )
          : CircularProgressIndicator(
              color: kPrimaryColor,
            );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _togglePasswordObscured() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _launchTermsAndConditions() async {
    const _url = "https://github.com/DiegoSepuSoto/manwe/blob/master/TERMS_AND_CONDITIONS.md";
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
