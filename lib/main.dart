import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> produtos = [
    {
      "nome": "Notebook",
      "descricao": "Notebook ultrafino com SSD",
      "preco": 899.99,
      "quantidade": 5
    },
    {
      "nome": "Mouse",
      "descricao": "Mouse óptico sem fio",
      "preco": 19.99,
      "quantidade": 50
    },
    {
      "nome": "Teclado",
      "descricao": "Teclado mecânico RGB",
      "preco": 59.99,
      "quantidade": 30
    },
    {
      "nome": "Monitor",
      "descricao": "Monitor LED 24 polegadas",
      "preco": 199.99,
      "quantidade": 20
    },
    {
      "nome": "Placa de Vídeo",
      "descricao": "Placa de vídeo NVIDIA GeForce RTX 3060",
      "preco": 499.99,
      "quantidade": 10
    },
    {
      "nome": "HD Externo",
      "descricao": "HD Externo USB 3.0 1TB",
      "preco": 79.99,
      "quantidade": 25
    },
    {
      "nome": "Roteador Wi-Fi",
      "descricao": "Roteador Wi-Fi dual-band AC1200",
      "preco": 49.99,
      "quantidade": 15
    },
    {
      "nome": "Impressora",
      "descricao": "Impressora multifuncional a jato de tinta",
      "preco": 129.99,
      "quantidade": 35
    },
    {
      "nome": "Cabo HDMI",
      "descricao": "Cabo HDMI 2.0 de alta velocidade 2 metros",
      "preco": 9.99,
      "quantidade": 5
    },
    {
      "nome": "Adaptador USB",
      "descricao": "Adaptador USB-C para HDMI, USB-A e Ethernet",
      "preco": 29.99,
      "quantidade": 8
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spark'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Opções'),
              ),
              ListTile(
                title: const Text('Equipe'),
                onTap: () {
                  print('Dados da Equipe');
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Recomendados',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ver todas',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  for (var produto in produtos)
                    ProductCard(
                      nome: produto['nome'],
                      preco: produto['preco'],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.nome, required this.preco});

  final String nome;
  final double preco;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80, // Largura desejada
            height: 115, // Altura desejada
            child: Image.asset(
              'assets/images/notebook.jpg',
              fit: BoxFit.cover, // Aplica o efeito de cobertura
            ),
          ),
          Text(nome),
          Text('R\$ ${preco.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}