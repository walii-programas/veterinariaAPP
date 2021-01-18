import 'package:appveterinaria/data/models/blog.dart';
import 'package:appveterinaria/data/services/service.blog.dart';
import 'package:flutter/material.dart';

class PageBlog extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<PageBlog> {
  List<Blog> _services = [];
  Widget build(BuildContext context) {
    if (_services == null || _services.length == 0) {
      _getAllService();
    }

    return Scaffold(
        appBar: AppBar(title: Text('BLOG'), backgroundColor: Colors.purple),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 600.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: _services.map<Widget>(_servicesCircle).toList(),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _servicesCircle(Blog service) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: <Widget>[
              Image(
                image: service.image == null
                    ? AssetImage('assets/image/logo.png')
                    : NetworkImage(service.image),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  service.name,
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(service.description)
            ],
          ),
        ));
  }

  void _getAllService() async {
    ServiceBlog servicio = ServiceBlog();
    List<Blog> services = await servicio.listAll();
    setState(() {
      this._services = services;
    });
  }
}
