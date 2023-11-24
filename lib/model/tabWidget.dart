import 'package:flutter/material.dart';
import '../API/sourcesResponse/Source.dart';

class tabWidget extends StatelessWidget {
  Source source;
  bool isSelected;
  tabWidget(this.isSelected, this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)
      ),
      child: Text(source.name??"" , style: TextStyle(
        color: isSelected ? Colors.white : Theme.of(context).primaryColor
      ),),
    );
  }
}
