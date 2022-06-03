import 'package:flutter/material.dart';
import 'package:forthapp/providers/product.dart';
import 'package:forthapp/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class UserProductITem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductITem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      trailing: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              try {
               await Provider.of<Products>(context, listen: false).deleteProduct(id);
              } catch (error) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("deleting failed")));
              }
            },
            color: Theme.of(context).errorColor,
          )
        ],
      ),
    );
  }
}
