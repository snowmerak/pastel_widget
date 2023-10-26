import 'package:flutter/material.dart';

class MultiAutocomplete<T> extends StatefulWidget {
  final List<MapEntry<String, T>> options;
  final Function(List<T>) callback;
  final String separator;

  const MultiAutocomplete(
      {super.key,
      required this.options,
      required this.callback,
      this.separator = ", "});

  @override
  State<MultiAutocomplete<T>> createState() => _MultiAutocompleteState<T>(
      options: options, callback: callback, separator: separator);
}

class _MultiAutocompleteState<T> extends State<MultiAutocomplete<T>> {
  final List<MapEntry<String, T>> options;
  final List<String> selected = [];
  final Function(List<T>) callback;
  final String separator;
  TextEditingValue textValue = TextEditingValue();

  _MultiAutocompleteState(
      {required this.options, required this.callback, this.separator = ", "});

  @override
  Widget build(BuildContext context) {
    final lowerCaseOptions = Map.fromEntries(
        options.map((e) => MapEntry(e.key.toLowerCase(), e.key)));

    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return lowerCaseOptions.keys.where((String option) {
          return textEditingValue.text
              .split(separator)
              .where((e) => e.isNotEmpty)
              .map((e) => e.toLowerCase())
              .map((e) => option.contains(e))
              .reduce((value, element) => value || element);
        }).map((e) => lowerCaseOptions[e]!);
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        textEditingController.text = selected.join(separator);
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
        );
      },
      onSelected: (option) => setState(() {
        if (selected.contains(option)) {
          selected.remove(option);
        } else {
          selected.add(option);
        }
        callback(selected
            .map((e) => options.firstWhere((element) => element.key == e).value)
            .toList());
      }),
    );
  }
}
