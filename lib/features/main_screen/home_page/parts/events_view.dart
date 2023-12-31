import 'package:tam_app/global_imports.dart';

class EventsView extends StatefulWidget {
  final List<EventsClass> eventsList;

  const EventsView({Key? key, required this.eventsList}) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 0.9 * MediaQuery.of(context).size.width,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  double screenWidth = 0.9 * MediaQuery.of(context).size.width;
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialogForEvents(
                              text: widget.eventsList[index].text,
                              title: widget.eventsList[index].title,
                              contacts: true,
                              date: widget.eventsList[index].date,
                            );
                          },
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.grey,
                            width: screenWidth,
                            child: Center(
                              child: Image.network(
                                  widget.eventsList[index].mainImageUrl,),
                            ),
                          ),
                          TitleDataLabel(
                            title: widget.eventsList[index].title,
                            side: 'left',
                            customWidth: 0.75 * screenWidth,
                          ),
                          DateDataLabel(data: widget.eventsList[index].date),
                        ],
                      ),
                    ),
                  );
                },
                childCount: widget.eventsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
