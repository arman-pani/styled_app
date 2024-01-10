import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nst_app/bloc/styling_bloc/styling_bloc.dart';
import 'package:nst_app/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'package:nst_app/constants/color_pallete.dart';
import 'package:nst_app/routers/app_startup_router.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = false;
  runApp(NSTApp(
    isLoggedIn: isLoggedIn,
  ));
}

class NSTApp extends StatelessWidget {
  final bool isLoggedIn;
  const NSTApp({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    late bool isDarkMode = true;
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserAuthBloc>(create: (_) => UserAuthBloc()),
        BlocProvider<StylingBloc>(create: (_) => StylingBloc()),
      ],
      child: MaterialApp.router(
          title: 'NST',
          theme: isDarkMode
              ? ThemeData.dark().copyWith(
                  iconTheme: const IconThemeData(color: Colors.white),
                  iconButtonTheme: IconButtonThemeData(
                      style: ButtonStyle(
                    iconColor: MaterialStateProperty.all(Colors.white),
                    iconSize: MaterialStateProperty.all(30),
                  )),
                  appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.transparent,
                      titleTextStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.all(10),
                    suffixIconColor: Colors.white60,
                    hintStyle: const TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: ColorPallete.defaultInputBorderColor)),
                  ),
                  textTheme: const TextTheme(
                    titleLarge: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pixelify Sans",
                      height: 0.9,
                    ),
                    // Username in post
                    titleSmall: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto Mono"),
                    // Creation time in post
                    labelSmall: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Roboto Mono",
                    ),
                  ),
                )
              : ThemeData.light().copyWith(
                  appBarTheme:
                      const AppBarTheme(backgroundColor: Colors.transparent),
                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.all(10),
                    suffixIconColor: Colors.black54,
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
          // home:
          routerConfig: AppStartupRouter().router
          // isLoggedIn ? MainAppRouter().router : AppStartupRouter().router,
          ),
    );
  }
}
