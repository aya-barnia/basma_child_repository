
import 'package:basma_child/view/Classes/api_class.dart';
import 'package:basma_child/view/Classes/classes_model.dart';
import 'package:basma_child/view/Classes/state_class.dart';
import 'package:basma_child/view/Classes/subject_model.dart';
import 'package:basma_child/view/Classes/title_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesCubit extends Cubit<ClassesState>{

ClassesCubit() :super(InitialState());


static ClassesCubit get(context) => BlocProvider.of(context);


ApiClasses apiClasses = ApiClasses();

List<ClassModel> classes = [];
List<Subject> sub =[];
List<TitleSub> title =[];



getAllClasses() async{
print('first stap class');
emit(LoadingClassState());

final post = await apiClasses.getClassess();
print('come back');

this.classes = post.map((e) => ClassModel.fromJson(e)).toList();
print(classes);

if(classes.isNotEmpty){
  print(' i am not empty');

  emit(GetAllClasses(classes));
  print('finish here');

}
else{

  emit(GetAllClassesError(message: 'get post error'));
  print('finish here');


}


}


getSubject( classId)  async {

print('first stap subject');
print(classId);
emit(LoadingClassState());

final subject = await apiClasses.getSubject(classId);
print('come back');

this.sub = subject.map((e) => Subject.fromJson(e)).toList();
print(sub);

if(sub.isNotEmpty){
  print(' i am not empty');

  emit(GetAllSubject(sub));
  print('finish here');

}
else{

  emit(GetAllSubjectError(message: 'get post error'));
  print('finish here');


}
}


getTitle( subId)  async {

print('first stap getTitle');
print(subId);
emit(LoadingClassState());

final title1 = await apiClasses.getTitle(subId);
print('come back');

this.title = title1.map((e) => TitleSub.fromJson(e)).toList();
print(title);

if(title.isNotEmpty){
  print(' i am not empty');
  print(title.toString());

  emit(GetAllTitle( subId, title));
  print('finish here');

}
else{

  emit(GetAllTitleError(message: 'get post error'));
  print('finish here');


}
}

}