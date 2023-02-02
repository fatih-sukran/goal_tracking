import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/screens/goal_detail_screen.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:goal_tracking/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet_widget.dart';

class GoalListItemWidget extends StatefulWidget {
  final Goal goal;
  const GoalListItemWidget({Key? key, required this.goal}) : super(key: key);

  @override
  State<GoalListItemWidget> createState() => _GoalListItemWidgetState();
}

class _GoalListItemWidgetState extends State<GoalListItemWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE0E3E7),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoalDetailScreen(
                      id: widget.goal.id!,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.goal.name,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: const Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Create template screen for task todo app.',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FlutterFlowIconButton(
              borderColor: const Color(0xFFF1F4F8),
              borderRadius: 8,
              borderWidth: 2,
              buttonSize: 40,
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFF57636C),
                size: 20,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: const BottomSheetWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              },
            ),
          ],
        ),
      ),
    );
  }
}
