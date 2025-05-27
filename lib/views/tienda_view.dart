import 'package:flutter/material.dart';
import 'package:prueba_p1/model/datos_model.dart';
import 'package:prueba_p1/views/informacion_tienda_view.dart';

class TiendaView extends StatelessWidget {
  final Ciudad ciudad;

  const TiendaView({super.key, required this.ciudad});

  IconData _iconSucursal() {
    return Icons.storefront_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sucursales en ${ciudad.nombre}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                blurRadius: 4,
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 6,
        backgroundColor: Colors.deepPurple[700],
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView.separated(
          itemCount: ciudad.sucursales.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final sucursal = ciudad.sucursales[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.deepPurple.withOpacity(0.25),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: Colors.deepPurple.withOpacity(0.2),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InformacionTiendaView(sucursal: sucursal),
                    ),
                  );
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          _iconSucursal(),
                          color: Colors.deepPurple[700],
                          size: 38,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          sucursal.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple,
                            letterSpacing: 0.5,
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
