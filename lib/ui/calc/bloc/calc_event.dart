part of 'calc_bloc.dart';

@immutable
abstract class CalcEvent {}

class Nums extends CalcEvent{}
class Plus extends CalcEvent{}
class Minus extends CalcEvent{}
class Multiply extends CalcEvent{}
class Equlaize extends CalcEvent{}


