import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/tabWidget.dart';
import 'package:news_application/newsListwidget.dart';

import '../API/sourcesResponse/Source.dart';

class SourceTabsWidget extends StatefulWidget {
  List<Source> sources;

  SourceTabsWidget(this.sources, {super.key});

  @override
  State<SourceTabsWidget> createState() => _SourceTabsWidgetState();
}

class _SourceTabsWidgetState extends State<SourceTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
              indicatorColor: Colors.transparent,
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              labelColor: Theme.of(context).primaryColor,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => tabWidget(
                      widget.sources.indexOf(source) == selectedIndex, source))
                  .toList()),
          Expanded(child: newsListWidget(widget.sources[selectedIndex]))
        ],
      ),
    );
  }
}
