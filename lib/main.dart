import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //ciao la banniere de debug
      title: 'Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Colonne de gauche : NavBar
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.dashboard, color: Colors.deepPurple),
                      title: Text('Dashboard',
                      style: TextStyle(
                        color: Colors.deepPurple),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_month),
                      title: Text('Calendar'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Users'),
                    ),
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text('Attendees'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                    ),
                  ],
                ),
              ),
            )
          ),
          //************
          // SECTION DE DROITE: searchbar et cards
          Expanded(
            flex: 8,
            child:
            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),//mettre l'icone a gauche
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          InfoCard(
                            backgroundColor: Colors.white,
                            titleColor: Colors.purple,
                            subtitleColor: Colors.blue,
                            contentColor: Colors.grey,
                            title: '108 orders received',
                            subtitle: '+7 orders today',
                            content: '79 shipped\n11 awaiting shipment\n18 pending',
                          ),
                          SizedBox(width: 8.0),
                          InfoCard(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.blue, Colors.purple],
                            ),
                            titleColor: Colors.white,
                            subtitleColor: Colors.white70,
                            contentColor: Colors.white,
                            title: '\$32.05 per unit',
                            subtitle: '534 units listed',
                            content: 'Average Price per unit',
                          ),
                          SizedBox(width: 8.0),
                          InfoCard(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.purple, Colors.blue],
                            ),
                            titleColor: Colors.white,
                            subtitleColor: Colors.white70,
                            contentColor: Colors.white,
                            title: '\$5,288.88',
                            subtitle: '+9.32%',
                            content: 'Revenue 165 units sold',
                          ),
                          SizedBox(width: 8.0),
                        ],
                      ),
                    )

                  ),
                  // Espace pour le graphique et peut-être l'espace pour une future autre carte

                  // Horizontal Scrollable Cards
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

//Les paramètres à passer pour les cards des infos => éviter la redondance.
class InfoCard extends StatelessWidget {
  final Color? backgroundColor; // le ? le rend optionnel
  final Gradient? gradient; // idem
  final Color titleColor;
  final Color subtitleColor;
  final Color contentColor;
  final String title;
  final String subtitle;
  final String content;

  const InfoCard({
    Key? key,
    this.backgroundColor, //n'est pas obligatoire
    this.gradient, // pareil
    required this.titleColor,
    required this.subtitleColor,
    required this.contentColor,
    required this.title,
    required this.subtitle,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Style des  cards.
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: titleColor, // Utilisation des paramètres pour la personnalisation
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 18,
                  color: subtitleColor,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  color: contentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



