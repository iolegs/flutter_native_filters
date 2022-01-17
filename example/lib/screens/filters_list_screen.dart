import 'package:flutter/material.dart';
import 'dart:async';

import 'package:native_filters/native_filters.dart';

class FiltersListScreen extends StatefulWidget {
  const FiltersListScreen({Key? key}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FiltersListScreen> {
  final filtersFactory = const CIFilterFactory();
  late Future<List<String>?> _loadFiltersFuture;

  @override
  void initState() {
    _loadFiltersFuture = filtersFactory.availableFilters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: FutureBuilder<List<String>?>(
        future: _loadFiltersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.hasData && snapshot.data!.isNotEmpty
                ? _filtersListView(snapshot.data!)
                : _emptyListView;
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget get _emptyListView {
    return const Center(
      child: Text('There is no avaiable filters'),
    );
  }

  Widget _filtersListView(List<String> filters) {
    return ListView(children: filters.map(_listItem).toList());
  }

  Widget _listItem(String name) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
