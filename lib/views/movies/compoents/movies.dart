part of '../view.dart';

class MoviesSection extends StatefulWidget {
  const MoviesSection({super.key});

  @override
  State<MoviesSection> createState() => _MoviesSectionState();
}

final kbloc=KiwiContainer().resolve<MoviesCubit>();
//final gbloc=GetIt.I<MoviesCubit>();

class _MoviesSectionState extends State<MoviesSection> {
  @override
  void initState() {
    kbloc.getMoviesData();
    //gbloc.getMoviesData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: kbloc,
      buildWhen: (previous, current) => current is MoviesLoadingState || current is MoviesFailedState || current is MoviesSuccessState,
      listener: (context, state) {
        if(state is MoviesFailedState)
          showMessage(state.msg);
        else if(state is MoviesPaginationState)
          showMessage(state.msg!,isSucess: true);
        else if(state is MoviesPaginationFinishedState)
          showMessage(state.msg!);
      },
      builder: (context, state) {
        if(state is MoviesFailedState)
          return Center(child: Text(state.msg,style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),));
        else if(state is MoviesSuccessState)
          return _list(state.dataList);
        else
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
      },
    );
  }

  Widget _list(List<MovieModel> movies) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
          kbloc.getMoviesData();
        }
        return true;
      },
      child: ListView.separated(
          itemBuilder: (context, index) =>  _item(movies[index]),
          separatorBuilder: (context, index) => Divider(color: Theme.of(context).primaryColor,indent: 50,endIndent: 50,),
          itemCount: movies.length
      ),
    );
  }

  Widget _item(MovieModel movie) {
    return InkWell(
      onTap: () {
        print(movie.title);
      },
      child: Card(
        color: Colors.yellow.withOpacity(.1),
        shadowColor: Colors.orange,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.red)
        ),
        child: Padding(
          padding:  EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 75,backgroundImage: NetworkImage("http://image.tmdb.org/t/p/w500/${movie.posterPath}"),),
              SizedBox(height: 16,),
              Text(movie.title,style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600,fontSize: 22),),
              SizedBox(height: 16,),
              Text(movie.releaseDate,style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600,fontSize: 22),),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(movie.voteAverage.toString(),style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600,fontSize: 22),),
                  SizedBox(width: 4,),
                  Icon(Icons.star,color: Colors.amber,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
