import 'package:flutter/material.dart';
import 'package:prueba_p1/controller/datos_controller.dart';
import 'package:prueba_p1/views/tienda_view.dart';

class CiudadView extends StatelessWidget {
  const CiudadView({super.key});

  IconData _iconForCity(String nombreCiudad) {
    // Puedes asignar iconos distintos por ciudad si quieres
    return Icons.location_city;
  }

  @override
  Widget build(BuildContext context) {
    final datosController = Datos_controller();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
        'Selecciona una Ciudad',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
        backgroundColor: Colors.deepPurple[700],
        elevation: 6,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade50,
              Colors.deepPurple.shade100.withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView.builder(
          itemCount: datosController.ciudades.length,
          itemBuilder: (context, index) {
            final ciudad = datosController.ciudades[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.deepPurple.withOpacity(0.3),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: Colors.deepPurple.withOpacity(0.2),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TiendaView(ciudad: ciudad),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          _iconForCity(ciudad.nombre),
                          color: Colors.deepPurple[700],
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          ciudad.nombre,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.deepPurple.shade300,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
