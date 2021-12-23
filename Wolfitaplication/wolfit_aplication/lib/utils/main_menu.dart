//crecion de las listas de navegacion 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wolfit_aplication/widgets/ejercicios_widget.dart';
import 'package:wolfit_aplication/widgets/informacion_widget.dart';
import 'package:wolfit_aplication/widgets/plan_widget.dart';
import 'package:wolfit_aplication/widgets/nutricion_widget.dart';

class MenuItem{
  String label;
  IconData icon;

  MenuItem(this.label, this.icon);

}

List<MenuItem> menuOption = [
  MenuItem("Plan", Icons.home_filled),
  MenuItem("Ejercicios", Icons.fitness_center_outlined),
  MenuItem("Información", Icons.assignment),
  MenuItem("Nutrición", Icons.flatware)
];


List<Widget> contentWidgets = [
  const PlanWidget(),
  const EjerciciosWidget(),
  const InformacionWidget(),
  const NutricionWidget()
];