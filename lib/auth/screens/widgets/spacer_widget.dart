import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late final StreamController<bool> spacer;

class SpacerWidget extends StatefulWidget {
  const SpacerWidget({Key? key}) : super(key: key);

  @override
  State<SpacerWidget> createState() => _SpacerWidgetState();
}

class _SpacerWidgetState extends State<SpacerWidget> {
  @override
  void initState() {
    super.initState();
    spacer = BehaviorSubject<bool>();
    spacer.sink.add(false);
  }

  @override
  void dispose() {
    super.dispose();
    spacer.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: spacer.stream,
      builder: (ctx, state) {
        if(state.hasData){
          if(state.data!){
            return Container(
              height: 60.h,
            );
          }
          return  Container(
          );
        }
        return Container();
      },
    );
  }
}
