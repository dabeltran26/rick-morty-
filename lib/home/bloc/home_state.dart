import 'package:flutter/material.dart';
import 'package:rickmorty_app/home/model/character.dart';

@immutable
abstract class HomeState {
  const HomeState();
  @override
  List<Object> get props => [];
}

class Initialized extends HomeState{
  @override
  String toString() => 'Init';
}

class DataState extends HomeState{
  final List<Result> myCharacters;
  const DataState(this.myCharacters);
  @override
  List<Object> get props => [myCharacters];

  @override
  String toString() => 'return characters';
}

