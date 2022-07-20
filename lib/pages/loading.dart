import 'package:flutter/material.dart';
import 'package:ninja/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

// 'http://worldtimeapi.org/api/timezone/Asia/Dhaka'

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Dhaka', flag: 'dhaka.png', url: 'Asia/Dhaka');
    await  instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Text('$time'),
      ),
    );
  }
}
