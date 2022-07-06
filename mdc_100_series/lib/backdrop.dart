import 'package:flutter/foundation.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    Key? key,
    required this.currentCategory,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
  }) : super(key: key);

  // @override
  // State<Backdrop> createState() => _BackdropState();
  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  Widget _buildStack() {
    return Stack(
      key: _backdropKey,
      children: [widget.backLayer, widget.frontLayer],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      leading: Icon(Icons.menu),
      title: Text('SHRINE'),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: _buildStack(),
    );
  }
}
