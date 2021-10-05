// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/gridsection.dart';
import 'widgets/registerbanner.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Provider.of<RoomProvider>(context,listen: false).getData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final server = Uri.https(baseurl,endpoint2+"2",params);
    // final url = Uri.parse("$server");
    // print(url);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: const[
              ClassroomManagerHeading(),
              RegisterBanner(),//This is registration banner
              ManageText(),
              GridSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassroomManagerHeading extends StatelessWidget {
  const ClassroomManagerHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text("Classroom Manager",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class ManageText extends StatelessWidget {
  const ManageText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text("Manage",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

