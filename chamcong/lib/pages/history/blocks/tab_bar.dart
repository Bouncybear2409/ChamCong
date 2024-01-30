import 'package:chamcong/data/network/api/api_call.dart';
import 'package:chamcong/pages/history/widgets/history_item.dart';
import 'package:chamcong/data/models/absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Lịch sử',
              style: TextStyle(
                color: Colors.white,
              )),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Lịch sử chấm công',
              ),
              Tab(
                text: 'Lịch sử nghỉ phép',
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            FutureBuilder<List<dynamic>>(
                future: ApiCall.fetchAbsenceAPI(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    final List<AbsenceResponse> data =
                        snapshot.data as List<AbsenceResponse>;
                    // return Text(data[0].reason ?? '');
                    return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryItem(
                            startDate: data[index].startDate ?? '',
                            endDate: data[index].endDate ?? '',
                            status: data[index].status ?? '',
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
