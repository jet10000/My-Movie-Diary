import 'package:meta/meta.dart';
import 'package:mymovie/resources/constants.dart';

class DiaryModel {
  final String movieCode;
  final String moviePubDate;
  final String movieTitle;
  final String movieMainPhoto;
  final List<String> movieStillCutList;

  String diaryTitle;
  String diaryContents;
  double diaryRating;

  int diaryUpdatedTime;

  String get docName => movieCode+"-"+movieTitle;

  bool isEditing() => diaryTitle!=null;

  Map<String,dynamic> toMap() {
    return {
      fDiaryMovieCodeField: movieCode,
      fDiaryMoviePubDateField: moviePubDate,
      fDiaryMovieTitleField: movieTitle,
      fDiaryMovieMainPhotoField: movieMainPhoto,
      fDiaryMovieStillcutListField: movieStillCutList,

      fDiaryTitleField: diaryTitle,
      fDiaryContentsField: diaryContents,
      fDiaryRatingField: diaryRating,

      fRecentUpdatedTimeField: diaryUpdatedTime
    };
  }

  factory DiaryModel.fromMap(Map<String,dynamic> map) {
    List<String> stillcutList = List<String>();
    for(dynamic stillcutLink in map[fDiaryMovieStillcutListField]){
      stillcutList.add(stillcutLink as String);
    }
    return DiaryModel(
      movieCode: map[fDiaryMovieCodeField],
      moviePubDate: map[fDiaryMoviePubDateField],
      movieTitle: map[fDiaryMovieTitleField],
      movieMainPhoto: map[fDiaryMovieMainPhotoField],
      movieStillCutList: stillcutList,

      diaryTitle: map[fDiaryTitleField],
      diaryContents: map[fDiaryContentsField],
      diaryRating: map[fDiaryRatingField],

      diaryUpdatedTime: map[fRecentUpdatedTimeField]
    );
  }

  DiaryModel.make({
    @required this.movieCode,
    @required this.moviePubDate,
    @required this.movieMainPhoto,
    @required this.movieTitle,
    @required this.movieStillCutList
  }) : assert(movieCode!=null),
       assert(movieTitle!=null),
       assert(moviePubDate!=null),
       assert(movieMainPhoto!=null),
       assert(movieStillCutList!=null);

  DiaryModel({
    @required this.movieCode,
    @required this.moviePubDate,
    @required this.movieMainPhoto,
    @required this.movieTitle,
    @required this.movieStillCutList,

    @required this.diaryTitle,
    @required this.diaryContents,
    @required this.diaryRating,

    @required this.diaryUpdatedTime
  }) : assert(movieCode!=null),
       assert(movieTitle!=null),
       assert(moviePubDate!=null),
       assert(movieMainPhoto!=null),
       assert(movieStillCutList!=null),
       assert(diaryTitle!=null),
       assert(diaryContents!=null),
       assert(diaryRating!=null),
       assert(diaryUpdatedTime!=null);

  DiaryModel copyWith({
    @required String diaryTitle,
    @required String diaryContents,
    @required double diaryRating,
    @required int time
  }) {
    this.diaryTitle = diaryTitle;
    this.diaryContents = diaryContents;
    this.diaryRating = diaryRating;
    this.diaryUpdatedTime = time;
    return this;
  }
}