import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spending, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          height: constraints.maxHeight,
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              FittedBox(child: Text('\$${spending.toStringAsFixed(0)}')),
              SizedBox(
                height: 4,
              ),
              Container(
                height: constraints.maxHeight * .70,
                width: 10,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(0, 140, 140, 140),
                        ),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10))),
                  )
                ]),
              ),
              SizedBox(
                height: 4,
              ),
              Text(label)
            ],
          ),
        );
      },
    );
  }
}
