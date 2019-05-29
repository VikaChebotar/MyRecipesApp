import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  @override
  AddRecipeState createState() => AddRecipeState();
}

class AddRecipeState extends State<AddRecipe> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var steps = getSteps();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new recipe'),
      ),

      body: new Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepTapped: (int step) => setState(() => _currentStep = step),
        onStepContinue: _currentStep < steps.length
            ? () => setState(() => _currentStep += 1)
            : null,
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        steps: <Step>[],
      ),
    );
  }

  List<Step> getSteps() {
    return [
      new Step(
        title: new Text('Basing info'),
        content: new Text('This is the first step.'),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      ),
      new Step(
        title: new Text('Ingredients'),
        content: new Text('This is the second step.'),
        isActive: _currentStep >= 0,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      new Step(
        title: new Text('Preparation'),
        content: new Text('This is the third step.'),
        isActive: _currentStep >= 0,
        state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
      )
    ];
  }
}
