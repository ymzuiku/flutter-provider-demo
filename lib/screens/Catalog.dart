import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_flutter/models/CarModel.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _MyAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => _MyListItem(index),
          ),
        ),
      ],
    ));
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.display4),
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    var item = Item(index);
    var textTheme = Theme.of(context).textTheme.title;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Text(
                item.name,
                style: textTheme,
              ),
            ),
            SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    Widget child;
    if (cart.loadings.contains(item)) {
      child = SpinKitChasingDots(
        color: Colors.blue,
        size: 16.0,
      );
    } else if (cart.items.contains(item)) {
      child = Icon(Icons.check, semanticLabel: 'ADDED');
    } else {
      child = Text('ADD');
    }
    return FlatButton(
      onPressed: () {
        cart.items.contains(item) ? cart.remove(item) : cart.add(item);
      },
      splashColor: Theme.of(context).primaryColor,
      child: child,
    );
  }
}
