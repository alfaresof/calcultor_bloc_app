import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calc_event.dart';
part 'calc_state.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  int numa = 2 , numb = 1 ;
  String Input = '0' , output = '0', expre = '';
  bool isTwo = true;
  CalcBloc() : super(CalcInitial())  {

    on<Nums> ((event,emit) => emit(updateValue(Input)));
  }
  static CalcBloc get(BuildContext context) => BlocProvider.of(context);

  CalcState changevalue(String inStr) {
    if (inStr != '=')expre = '+-/*'.contains(inStr) ? inStr : 'null';

    switch(inStr){
      case '+':
        numb += numa;
        break;
      case '-':
        numb -= numa;
        break;
      case '/':
       numb ~/ numa;
        break;
      case '*':
        numb *= numa;
        break;
      case 'AC':
        numa = 0;
        numb = 0;
        expre = '';
        output = '0';
        isTwo = true;
        break;
      case 'C':
        output = '0';
        isTwo ?  numa = 0 : numb = 0 ;
        isTwo = !isTwo;
        break;
      case '=':
        isTwo = true;
        changevalue(expre);
        output = numb.toString();
        print(expre);
        //updateValue(expre);
        print(expre);
    }

    return GoalState();
  }

  CalcState updateValue(String inStr) {

    if('0123456789'.contains(inStr)&&output.length<9){
      isTwo ? numa =  int.parse(numa.toString()+inStr) : numb = int.parse(numb.toString()+inStr);
      output = isTwo ?numa.toString() : numb.toString();



    }else if('+-*/'.contains(inStr)){
      expre = inStr;
      isTwo = !isTwo;
      output = '0';
    }else if('+/-%'.contains(inStr)){
      switch(inStr){
        case '+/-':
          isTwo ? numa =0- numa : numb = 0-numb;
          output = isTwo ? numa.toString() : numb.toString();
          break;
        case '%':
          isTwo ? numa =numa~/100 : numb = numa~/100;
          output = isTwo ? numa.toString() : numb.toString();
          break;
      }
    }else{

      changevalue(inStr);


    }

    return GoalState();
  }
}
