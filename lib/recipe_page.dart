import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  @override
  AddRecipeState createState() => AddRecipeState();
}

class AddRecipeState extends State<AddRecipe> {
  RecipeBasicInfo basicInfo;
  List<Step> steps;
  int _currentStep = 0;

  AddRecipeState() {
    steps = getSteps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new recipe'),
      ),
      body: new Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: (int step) => setState(() => _currentStep = step),
          onStepContinue: getOnStepContinue(),
          onStepCancel:
              _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          steps: steps),
    );
  }

  List<Step> getSteps() {
    return [
      new Step(
        title: new Text('Basic info'),
        content: BasicInfoStep(basicInfoCallback: (val) => basicInfo = val),
        isActive: true,
        state: getStepState(0),
      ),
      new Step(
        title: new Text('Ingredients'),
        content: IngredientsStep(),
        isActive: true,
        state: getStepState(1),
      ),
      new Step(
        title: new Text('Preparation'),
        content: PreparationStep(),
        isActive: true,
        state: getStepState(2),
      )
    ];
  }

  Function getOnStepContinue() {
    if (_currentStep < steps.length - 1) {
      return () {
        if (isValid()) {
          return setState(() => _currentStep += 1);
        } else {
          return null;
        }
      };
    } else {
      return null;
    }
  }

  bool isValid() {
    bool isValid = true;
    if (steps[_currentStep].content is BasicInfoStep) {
      isValid = (steps[_currentStep].content as BasicInfoStep)
          .formKey
          .currentState
          .validate();
      if (isValid) {
        (steps[_currentStep].content as BasicInfoStep)
            .formKey
            .currentState
            .save();
      }
    }
    return isValid;
  }

  StepState getStepState(int position) {
    return _currentStep >= position ? StepState.complete : StepState.disabled;
  }
}

typedef void BasicInfoCallback(RecipeBasicInfo val);

class BasicInfoStep extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final BasicInfoCallback basicInfoCallback;
  final RecipeBasicInfo basicInfo = RecipeBasicInfo();

  BasicInfoStep({this.basicInfoCallback});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Title2'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter title';
              }
            },
            onSaved: (val) {
              basicInfo.title = val;
              onSaved();
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Source, URL'),
            onSaved: (val) {
              basicInfo.sourceUrl = val;
              onSaved();
            }
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Comments'),
            onSaved: (val) {
              basicInfo.comments = val;
              onSaved();
            }
          )
        ],
      ),
    );
  }

  void onSaved() {
    if (basicInfo.title != null &&
        basicInfo.sourceUrl != null &&
        basicInfo.comments != null) {
      basicInfoCallback(basicInfo);
    }
  }
}

class IngredientsStep extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Text("Step2");
  }
}

class PreparationStep extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Text("Step3");
  }
}

class RecipeDetails {
  List<String> ingredients;
  List<String> preparationSteps;
}

class RecipeBasicInfo {
  String title;
  String sourceUrl;
  String comments;
}
