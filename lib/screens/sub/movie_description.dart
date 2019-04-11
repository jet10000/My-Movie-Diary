
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovie/logics/movie/movie.dart';
import 'package:mymovie/utils/service_locator.dart';

class MovieDescription extends StatelessWidget {

  final String description;

  const MovieDescription({
    Key key, 
    @required this.description,
  }) : assert(description!=null),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieEvent,MovieState>(

      bloc: sl.get<MovieBloc>(),
      builder: (context, state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: state.isMoreButtonClicked
              ? null : MediaQuery.of(context).size.height*0.28,
              color: Colors.black,
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  height: 1.3
                ),
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                state.isMoreButtonClicked ? '접기' : '더보기',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                ),
              ),
            )
          ],
        );
      }
    );
  }
}