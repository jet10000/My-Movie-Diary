import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovie/logics/diary/diary.dart';
import 'package:mymovie/models/diary_model.dart';
import 'package:mymovie/models/movie_model.dart';
import 'package:mymovie/resources/strings.dart';
import 'package:mymovie/screens/main/diary_result_screen.dart';
import 'package:mymovie/screens/sub/diary_frame.dart';
import 'package:mymovie/utils/bloc_navigator.dart';
import 'package:mymovie/utils/bloc_snackbar.dart';
import 'package:mymovie/utils/service_locator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DiaryEditScreen extends StatefulWidget {

  final MovieModel movie;

  const DiaryEditScreen({Key key, @required this.movie}) : super(key: key);

  @override
  _DiaryEditScreenState createState() => _DiaryEditScreenState();
}

class _DiaryEditScreenState extends State<DiaryEditScreen> {

  @override
  void initState() {
    super.initState();
    sl.get<DiaryBloc>().dispatch(DiaryEventStateClear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<DiaryEvent,DiaryState>(
          bloc: sl.get<DiaryBloc>(),
          builder: (context, state){ 
            if(state.isDiaryCompleteSucceeded) {
              BlocNavigator.pushNamedAndRemoveUntilWithRoute(
                context, 
                MaterialPageRoute(builder: (_) => DiaryResultScreen(diaryModel: state.diaryModel)), 
                routeHome
              );
            }
            if(state.isDiaryCompleteLoading || state.isDiaryCompleteSucceeded){
              return SpinKitWave(
                color: Colors.white,
                size: 50.0,
              );
            }
            if(state.isDiaryCompleteFailed) {
              BlocSnackbar.show(context,'일기를 저장하는데 실패했습니다.');
            }
            return DiaryFrame(movie: widget.movie);
          }
        )
      )
    );
  }
}

class DiaryCompleteButton extends StatelessWidget {

  final DiaryModel diaryModel;

  const DiaryCompleteButton({Key key, @required this.diaryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Icon(Icons.check,color: Colors.white,size: 50.0),
      ),
      onTap: () => sl.get<DiaryBloc>().dispatch(DiaryEventComplete(diaryModel: diaryModel)),
    );
  }
}