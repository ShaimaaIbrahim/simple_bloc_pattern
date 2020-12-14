import 'dart:async';
import 'package:bloc_pattern/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc {

  int _counter =0;

  final  _counterStreamController = StreamController<int>();
  StreamSink get _inController => _counterStreamController.sink;
  Stream  get outController => _counterStreamController.stream;


  final _counterEventController = StreamController<CounterEvent>();
  StreamSink get counterEventSink => _counterStreamController.sink;
  Stream get counterEventStream => _counterStreamController.stream;

  //constructor
  CounterBloc(){
   _counterEventController.stream.listen(mapEventToState);
  }

  void  mapEventToState(CounterEvent event){
     if(event is IncreamentEvent){
        _counter++;
     }else{
       _counter--;
     }
     _inController.add(_counter);
  }

  void dispose(){
    _counterEventController.close();
    _counterStreamController.close();
  }

}
