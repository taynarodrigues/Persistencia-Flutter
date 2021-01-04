
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection:  Axis.horizontal,
                children: [
                  _FeatureItem('Transfer', Icons.monetization_on, onClick: () {
                    _showContactList(context);
                  },),
                  _FeatureItem('Transaction Feed', Icons.description, onClick: () => print('transaction feed was clicked'),), 
              ],
              ),
          ),         
        ],
      ),
    );
  }

  void _showContactList(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactsList() ,)
    );
  }
}
class _FeatureItem  extends StatelessWidget {

  final String name;
  final IconData icon; 
  final Function onClick;

  _FeatureItem(this.name, this.icon, {@required this.onClick,});

  @override
  Widget build(BuildContext context) {
    return              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () => onClick(),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 120,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          Text(
                           name,
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactsList(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
