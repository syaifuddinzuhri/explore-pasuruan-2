import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/profile/profile_bloc.dart';
import 'package:miniproject/bloc/profile/profile_event.dart';
import 'package:miniproject/bloc/profile/profile_state.dart';
import 'package:miniproject/constants/color_constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(),
            );
          } else if (state is ProfileLoadedState) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/hero.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: double.infinity,
                    height: 210,
                    child: Container(
                      alignment: Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage(state.profile.photo.toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  state.profile.name.toString(),
                  style: TextStyle(
                      fontSize: 25.0,
                      color: mBlueColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Prigen, Pasuruan",
                  style: TextStyle(
                      fontSize: 14,
                      color: mSubtitleColor,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "State Polytechnic of Malang",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black45,
                      fontWeight: FontWeight.w400),
                ),
              ],
            );
          } else if (state is ProfileErrorState) {
            return Text('Error');
          } else {
            return Container();
          }
        })),
      ),
    );
  }
}
