import 'package:flutter/material.dart';
import 'package:goal_tracking/components/appbar.dart';

class CreateGoal extends StatefulWidget {
  const CreateGoal({Key? key}) : super(key: key);

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  TextEditingController? goalNameController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    goalNameController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    goalNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        leading: const BackButton(),
        title: const Text('Create Goal'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: _createGoalForm(context),
        ),
      ),
    );
  }

  Form _createGoalForm(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _goalNameInput(context),
              _datesInput(context),
            ],
          ),
          _createTaskButton(),
        ],
      ),
    );
  }

  Padding _datesInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).backgroundColor,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start Date',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Icon(
                      Icons.date_range_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.44,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).backgroundColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Due Date',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _goalNameInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      child: TextFormField(
        controller: goalNameController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Goal Name',
          labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontFamily: 'Poppins',
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.normal,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.start,
      ),
    );
  }

  Padding _createTaskButton() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
      child: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState == null ||
                !formKey.currentState!.validate()) {
              return;
            }
          },
          child: const Text('Create Task')),
    );
  }
}
