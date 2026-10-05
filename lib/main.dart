import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receitas Favoritas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class Receita {
  final String nome;
  final String descricao;
  final List<String> ingredientes;
  final String preparo;
  final IconData icone;

  const Receita({
    required this.nome,
    required this.descricao,
    required this.ingredientes,
    required this.preparo,
    required this.icone,
  });
}

const doces = [
  Receita(
    nome: 'Brigadeiro',
    descricao: 'O doce brasileiro mais querido, cremoso e fácil de fazer.',
    ingredientes: [
      '1 lata de leite condensado',
      '2 colheres de chocolate em pó',
      '1 colher de manteiga',
      'Granulado',
    ],
    preparo: 'Misture o leite condensado, o chocolate e a manteiga. Cozinhe em fogo baixo, mexendo até soltar do fundo da panela. Espere esfriar, faça bolinhas e passe no granulado.',
    icone: Icons.cookie,
  ),
  Receita(
    nome: 'Bolo de Cenoura',
    descricao: 'Bolo macio de cenoura com cobertura de chocolate.',
    ingredientes: [
      '3 cenouras',
      '3 ovos',
      '2 xícaras de farinha',
      '1 xícara de açúcar',
      'Cobertura de chocolate',
    ],
    preparo: 'Bata no liquidificador a cenoura, os ovos e o açúcar. Misture com a farinha e asse por cerca de 40 minutos. Cubra com a calda de chocolate.',
    icone: Icons.cake,
  ),
  Receita(
    nome: 'Mousse de Maracujá',
    descricao: 'Sobremesa gelada, leve e refrescante.',
    ingredientes: [
      '1 lata de leite condensado',
      '1 caixa de creme de leite',
      '1 medida de suco de maracujá',
    ],
    preparo: 'Bata todos os ingredientes no liquidificador até ficar cremoso. Coloque em uma travessa e deixe na geladeira por duas horas.',
    icone: Icons.icecream,
  ),
];

const salgadas = [
  Receita(
    nome: 'Lasanha à Bolonhesa',
    descricao: 'Massa, molho de carne e bastante queijo gratinado.',
    ingredientes: [
      'Massa de lasanha',
      '500 g de carne moída',
      'Molho de tomate',
      'Presunto e queijo',
      'Molho branco',
    ],
    preparo: 'Refogue a carne e adicione o molho. Em um refratário, alterne camadas de molho, massa, presunto e queijo. Finalize com molho branco e asse até dourar.',
    icone: Icons.dinner_dining,
  ),
  Receita(
    nome: 'Coxinha de Frango',
    descricao: 'Salgado frito com recheio cremoso de frango.',
    ingredientes: [
      'Peito de frango cozido',
      'Massa para coxinha',
      'Requeijão',
      'Farinha de rosca',
      'Óleo para fritar',
    ],
    preparo: 'Misture o frango desfiado com requeijão. Recheie a massa, modele em formato de coxinha, empane na farinha de rosca e frite em óleo quente.',
    icone: Icons.bakery_dining,
  ),
  Receita(
    nome: 'Torta de Frango',
    descricao: 'Torta salgada prática para o almoço ou lanche.',
    ingredientes: [
      'Frango desfiado',
      'Milho',
      'Ervilha',
      '2 ovos',
      'Leite',
      'Farinha de trigo',
    ],
    preparo: 'Prepare um recheio com frango, milho e ervilha. Bata os ingredientes da massa, despeje metade em uma forma, adicione o recheio e cubra com o restante. Asse até dourar.',
    icone: Icons.pie_chart,
  ),
];

const bebidas = [
  Receita(
    nome: 'Limonada',
    descricao: 'Bebida cítrica e refrescante para dias quentes.',
    ingredientes: [
      '2 limões',
      '500 ml de água gelada',
      'Açúcar a gosto',
      'Gelo',
    ],
    preparo: 'Esprema os limões, misture o suco com água e açúcar. Sirva com bastante gelo.',
    icone: Icons.local_drink,
  ),
  Receita(
    nome: 'Vitamina de Banana',
    descricao: 'Bebida nutritiva e rápida para o café da manhã.',
    ingredientes: [
      '2 bananas',
      '250 ml de leite',
      '1 colher de aveia',
      'Mel a gosto',
    ],
    preparo: 'Bata todos os ingredientes no liquidificador até ficar homogêneo. Sirva imediatamente.',
    icone: Icons.blender,
  ),
  Receita(
    nome: 'Chocolate Quente',
    descricao: 'Chocolate cremoso para aquecer os dias frios.',
    ingredientes: [
      '2 xícaras de leite',
      '2 colheres de chocolate em pó',
      '1 colher de amido de milho',
      'Açúcar a gosto',
    ],
    preparo: 'Misture todos os ingredientes ainda frios. Leve ao fogo baixo e mexa até engrossar. Sirva quente.',
    icone: Icons.coffee,
  ),
];

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Receitas Favoritas'),
          centerTitle: true,
        ),
        drawer: const MenuLateral(),
        body: const TabBarView(
          children: [
            ListaReceitas(receitas: doces),
            ListaReceitas(receitas: salgadas),
            ListaReceitas(receitas: bebidas),
          ],
        ),
        bottomNavigationBar: const Material(
          color: Colors.orange,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.cake), text: 'Doces'),
              Tab(icon: Icon(Icons.restaurant), text: 'Salgadas'),
              Tab(icon: Icon(Icons.local_cafe), text: 'Bebidas'),
            ],
          ),
        ),
      ),
    );
  }
}

class ListaReceitas extends StatelessWidget {
  final List<Receita> receitas;

  const ListaReceitas({super.key, required this.receitas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: receitas.length,
      itemBuilder: (context, index) {
        final receita = receitas[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(child: Icon(receita.icone)),
            title: Text(receita.nome),
            subtitle: Text(receita.descricao),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaDetalhes(receita: receita),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class TelaDetalhes extends StatelessWidget {
  final Receita receita;

  const TelaDetalhes({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita.nome)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(receita.icone, size: 80, color: Colors.orange)),
            const SizedBox(height: 20),
            Text(
              receita.nome,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              receita.descricao,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Text('Ingredientes', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...receita.ingredientes.map(
              (ingrediente) => Text('• $ingrediente'),
            ),
            const SizedBox(height: 24),
            Text(
              'Modo de preparo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(receita.preparo),
          ],
        ),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.menu_book, color: Colors.white, size: 48),
                SizedBox(height: 12),
                Text(
                  'Receitas Favoritas',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TelaConfiguracoes(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaSobre()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: const Center(
        child: Text('Aqui ficarão as configurações do aplicativo.'),
      ),
    );
  }
}

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Receitas Favoritas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('Aplicativo criado para a Atividade 4 de Flutter.'),
            SizedBox(height: 8),
            Text('Versão 1.0.0'),
          ],
        ),
      ),
    );
  }
}
