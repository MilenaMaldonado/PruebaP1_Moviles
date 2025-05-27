import 'package:flutter/material.dart';
import 'package:prueba_p1/model/datos_model.dart';

class InformacionTiendaView extends StatelessWidget {
  final Sucursal sucursal;

  const InformacionTiendaView({super.key, required this.sucursal});

  @override
  Widget build(BuildContext context) {
    final totalVentas = sucursal.ventasTotales;
    final direccion = sucursal.direccion ?? 'Dirección no disponible';
    final telefono = sucursal.telefono ?? 'Teléfono no disponible';

    final int numEmpleados = sucursal.empleados.length;
    final double promedioVentas = numEmpleados == 0
        ? 0
        : totalVentas / numEmpleados;

    Empleado? mejorVendedor;
    Empleado? peorVendedor;
    if (numEmpleados > 0) {
      mejorVendedor =
          sucursal.empleados.reduce((a, b) => a.ventas > b.ventas ? a : b);
      peorVendedor =
          sucursal.empleados.reduce((a, b) => a.ventas < b.ventas ? a : b);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalles de ${sucursal.nombre}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              shadowColor: Colors.deepPurple.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Icon(
                        Icons.storefront_rounded,
                        size: 64,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sucursal.nombre,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Dirección: $direccion',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Teléfono: $telefono',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Nueva sección de estadísticas
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              shadowColor: Colors.deepPurple.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estadísticas Generales',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepPurple.shade800,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                        'Total de ventas: \$${totalVentas.toStringAsFixed(2)}'),
                    Text('Número de empleados: $numEmpleados'),
                    Text('Promedio de ventas por empleado: \$${promedioVentas
                        .toStringAsFixed(2)}'),
                    if (mejorVendedor != null)
                      Text('Mejor vendedor: ${mejorVendedor
                          .nombre} (\$${mejorVendedor.ventas.toStringAsFixed(
                          2)})'),
                    if (peorVendedor != null)
                      Text('Empleado con menos ventas: ${peorVendedor
                          .nombre} (\$${peorVendedor.ventas.toStringAsFixed(
                          2)})'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Empleados y Ventas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple.shade800,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.builder(
                itemCount: sucursal.empleados.length,
                itemBuilder: (context, index) {
                  final empleado = sucursal.empleados[index];
                  final porcentaje = totalVentas == 0
                      ? 0.0
                      : empleado.ventas / totalVentas;

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor:
                            Colors.deepPurple.withOpacity(0.2),
                            child: Text(
                              empleado.nombre[0].toUpperCase(),
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  empleado.nombre,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ventas: \$${empleado.ventas.toStringAsFixed(
                                      2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: porcentaje,
                                    minHeight: 8,
                                    backgroundColor: Colors.grey.shade300,
                                    color: Colors.deepPurple.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
