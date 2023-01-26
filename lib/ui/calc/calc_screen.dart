import 'package:calculatorapp/ui/calc/bloc/calc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class clac extends StatelessWidget {
  const clac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> num = ['AC','+/-','C','/','1','2','3','+','4','5','6','-','7','8','9','*','0','='];
    const List<String> nums = ['1','2','3','4','5','6','7','8','9','0'];
    return BlocProvider(
      create: (BuildContext context)=> CalcBloc(),
      child: BlocConsumer<CalcBloc,CalcState>(
      listener: (context,CalcState){
        if (CalcState is GoalState){
        print("${CalcState}");
        }
      },
    builder: (context,CalcState){
      int count = CalcBloc.get(context).numa;
      int count2 = CalcBloc.get(context).numb;
      bool tw = CalcBloc.get(context).isTwo;
      print(count);
      print(count2);
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(

            children:  <Widget>[
              const SizedBox(height: 200,),
              Text(
                '${CalcBloc.get(context).output}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                ),
              ),
              Expanded(
                flex: 4,
                child: GridView.builder(

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: num.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(

                        padding: const EdgeInsets.all(10.0),

                        child: ElevatedButton(
                          onPressed: (){
                            if('0123456789'.contains(num[index])){
                              print('${num[index]}');



                            }
                            CalcBloc.get(context).Input = num[index];
                            CalcBloc.get(context).add(Nums());
                          },
                          child:Text('${num[index]}',style: TextStyle(color: Colors.white,fontSize: 20),),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(CircleBorder()),
                            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                            backgroundColor: MaterialStateProperty.all(
                                '+-*=/'.contains(num[index])?Colors.amber:Colors.white10
                            ), // <-- Button color
                          ),
                        ),

                      );
                    }),
              ),
            ],
          ),
        ),
      );

    }
      ),
    );
  }
}
