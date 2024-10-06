import 'package:basma_child/view/Classes/classes_model.dart';
import 'package:basma_child/view/Classes/subject_model.dart';
import 'package:basma_child/view/Classes/title_model.dart';


abstract class ClassesState{} 

class InitialState extends ClassesState{}

class LoadingClassState  extends ClassesState{}

 class GetAllClasses extends ClassesState{

  List<ClassModel> cal =[];

  GetAllClasses( this.cal);


 }


  class GetAllClassesError extends ClassesState{

  String message;

  GetAllClassesError({required this.message});


 }


 class GetAllSubject extends ClassesState{

  List<Subject> cal =[];

  GetAllSubject(this.cal);


 }


  class GetAllSubjectError extends ClassesState{

  String message;

  GetAllSubjectError({required this.message});


 }

 class GetAllTitle extends ClassesState{

 var subId;
  List<TitleSub> cal =[];

  GetAllTitle(this.subId ,this.cal);


 }


  class GetAllTitleError extends ClassesState{

  String message;

  GetAllTitleError({required this.message});


 }

