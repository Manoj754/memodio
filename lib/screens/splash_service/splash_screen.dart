import 'package:memodio/screens/home/home_screen.dart';
import 'package:memodio/screens/splash_service/block/splash_cubit.dart';
import 'package:memodio/screens/splash_service/block/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashCompliteSplashState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SizedBox(
                  height: double.infinity,
                  child: Image.asset(
                    "assets/Images/splash.png",
                    fit: BoxFit.fill,
                  )),
              const Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Center(child: CircularProgressIndicator()))
            ],
          );
        },
      ),
    );
  }
}
