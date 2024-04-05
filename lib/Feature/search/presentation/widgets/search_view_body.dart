import 'package:flutter/widgets.dart';

class SearchExplorViewBody extends StatefulWidget {
  const SearchExplorViewBody({super.key});

  @override
  State<SearchExplorViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchExplorViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Search View',
          ),
        )
      ],
    );
  }
}
