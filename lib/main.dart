import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Flutter',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showContact = false;

  // Widget simple para items de lista
  Widget _buildItem(String title, String subtitle, String date, [String? desc]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[600], fontStyle: FontStyle.italic)),
        if (desc != null) Text(desc, style: TextStyle(fontSize: 13, color: Colors.grey[800])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Ancho de las tarjetas responsive
    double cardWidth;
    if (screenWidth > 1200) {
      cardWidth = 800;
    } else if (screenWidth > 900) {
      cardWidth = 700;
    } else if (screenWidth > 600) {
      cardWidth = screenWidth * 0.8;
    } else {
      cardWidth = screenWidth - 32;
    }
    
    // Ancho del perfil también responsive
    double profileWidth;
    if (screenWidth > 900) {
      profileWidth = 470;
    } else if (screenWidth > 600) {
      profileWidth = screenWidth * 0.8;
    } else {
      profileWidth = screenWidth * 0.7;
    }
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Contenedor de perfil
                Container(
                  width: profileWidth,
                  height: 300,
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyProfilePicture(),
                      const SizedBox(height: 20),
                      Text(
                        'Martín Sánchez Novo',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Estudiante en Fernando Wirtz',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      // Mostrar email si se activa el FAB
                      if (_showContact)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            '📧 martinwirtzfp@gmail.com',
                            style: TextStyle(fontSize: 14, color: Colors.blue[900]),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Contenedor con Stack para Estudios
                InfoCard(
                  width: cardWidth,
                  icon: Icons.school_outlined,
                  iconColor: Colors.blue,
                  title: 'Estudios',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildItem('Desarrollo de Aplicaciones Multiplataforma', 'IES Fernando Wirtz', '2024 - Actualidad'),
                      const SizedBox(height: 10),
                      _buildItem('Ingeniería Informática', 'Universidad de La Coruña', '2020 - 2024'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Contenedor con Stack para Experiencia
                InfoCard(
                  width: cardWidth,
                  icon: Icons.work_outline,
                  iconColor: Colors.green,
                  title: 'Experiencia Laboral',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildItem('Desarrollador Junior', 'Inditex', '2023 - Presente', 'Desarrollo de aplicaciones móviles con Flutter'),
                      const SizedBox(height: 10),
                      _buildItem('Prácticas Profesionales', 'Temu', '2023', 'Colaboración en proyectos web'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Bloque de Tecnologías con ListView.builder y Expanded
                Container(
                  width: cardWidth,
                  height: 300,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.code, color: Colors.purple, size: 28),
                          const SizedBox(width: 10),
                          Text(
                            'Tecnologías',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            final technologies = [
                              {'name': 'Flutter', 'icon': Icons.phone_android, 'color': Colors.blue},
                              {'name': 'Dart', 'icon': Icons.code, 'color': Colors.cyan},
                              {'name': 'Firebase', 'icon': Icons.cloud, 'color': Colors.orange},
                              {'name': 'Git', 'icon': Icons.source, 'color': Colors.red},
                              {'name': 'JavaScript', 'icon': Icons.javascript, 'color': Colors.yellow[700]},
                              {'name': 'Python', 'icon': Icons.settings, 'color': Colors.green},
                              {'name': 'Android Studio', 'icon': Icons.android, 'color': Colors.lightGreen},
                              {'name': 'VS Code', 'icon': Icons.computer, 'color': Colors.blueAccent},
                            ];
                            // Duda final tech
                            final tech = technologies[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    tech['icon'] as IconData,
                                    color: tech['color'] as Color,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    tech['name'] as String,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showContact = !_showContact;
          });
        },
        tooltip: 'Mostrar contacto',
        child: Icon(_showContact ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}

// Widget personalizado para foto de perfil
class MyProfilePicture extends StatelessWidget {
  const MyProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 75,
      backgroundImage: NetworkImage(
        'https://shapes.inc/api/public/avatar/wario-ly2q',
      ),
    );
  }
}

// Widget personalizado reutilizable para las secciones con Stack
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.width,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.child,
  });

  final double width;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: Icon(icon, size: 80, color: iconColor.withOpacity(0.1)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: 28),
                  const SizedBox(width: 10),
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: iconColor)),
                ],
              ),
              const SizedBox(height: 15),
              child,
            ],
          ),
        ],
      ),
    );
  }
}