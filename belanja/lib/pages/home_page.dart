import "package:belanja/models/item.dart";
import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Item> items = [
    Item(
        name: "Sugar",
        price: 5000,
        foto:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDnyPvTd_6UT0t5x26xr3x1rwFMQSBetxBtA&s",
        stok: 10,
        rating: 3.0),
    Item(
        name: "Salt",
        price: 2000,
        foto:
            "https://akcdn.detik.net.id/visual/2021/01/25/ilustrasi-garam-1_169.jpeg?w=650",
        stok: 5,
        rating: 4.5),
  ];

  Widget footer = Container(
    padding: const EdgeInsets.all(8),
    child: const Text(
      'Nama: Rizky Arifiansyah\nNIM: 2241720040\n',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {
                      context.go('/item', extra: item);
                    },
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: Hero(
                                tag: item.name,
                                child: Image.network(
                                  item.foto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Image.network(item.foto),
                            Text(item.name),
                            Text('Rp ${item.price}'),
                            Text('Stock: ${item.stok}'),
                            Text('Rating: ${item.rating}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          footer,
        ],
      ),
    );
  }
}
