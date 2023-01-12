import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // context.pushNamed('create_goal');
          Navigator.pushNamed(context, 'create_goal');
        },
        backgroundColor: Theme.of(context).primaryColor,
        icon: const Icon(
          Icons.add,
        ),
        elevation: 8,
        label: Text(
          'Create Goal',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontFamily: 'Poppins',
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Goal Tracking',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x230E151B),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 12, 0, 0),
                          child: Text(
                            'Goal Summary',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 16, 16, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 12),
                                      child: CircularPercentIndicator(
                                        percent: 0.23,
                                        radius: 45,
                                        lineWidth: 12,
                                        animation: true,
                                        progressColor:
                                            Theme.of(context).primaryColor,
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                        center: Text('23%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    fontFamily: 'Poppins',
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                      ),
                                    ),
                                    Text(
                                      'Last 30 Days Goals',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 12),
                                      child: CircularPercentIndicator(
                                        percent: 0.93,
                                        radius: 45,
                                        lineWidth: 12,
                                        animation: true,
                                        progressColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                        center: Text(
                                          '93%',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                fontFamily: 'Poppins',
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Today Goals',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              goalItemList(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded goalItemList() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          // child: FutureBuilder<List<GoalsRecord>>(
          //   future: queryGoalsRecordOnce(),
          //   builder: (context, snapshot) {
          //     // Customize what your widget looks like when it's loading.
          //     if (!snapshot.hasData) {
          //       return Center(
          //         child: SizedBox(
          //           width: 50,
          //           height: 50,
          //           child: CircularProgressIndicator(
          //             color: FlutterFlowTheme.of(context).primaryColor,
          //           ),
          //         ),
          //       );
          //     }
          //     List<GoalsRecord> columnGoalsRecordList = snapshot.data!;
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(8, (columnIndex) {
                // final columnGoalsRecord =
                //     columnGoalsRecordList[columnIndex];
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                  child: InkWell(
                    // onTap: () async {
                    //   context.pushNamed('goal_calander');
                    // },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Goal Title",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: Text(
                                "Goal Details",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}
