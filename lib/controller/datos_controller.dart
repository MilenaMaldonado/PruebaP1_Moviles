import 'package:flutter/material.dart';
import 'package:prueba_p1/theme/app_theme.dart';
import 'package:prueba_p1/model/datos_model.dart';

class Datos_controller {
  final List<Ciudad> ciudades = [
    Ciudad('Ciudad A', [
      Sucursal(
        'Sucursal 1',
        [
          Empleado('Juan', 1000),
          Empleado('Ana', 1500),
        ],
        'Calle 123, Ciudad A',      // dirección
        '+1 111 222 3333',          // teléfono
      ),
      Sucursal(
        'Sucursal 2',
        [
          Empleado('Luis', 2000),
        ],
        'Avenida 456, Ciudad A',
        '+1 111 222 4444',
      ),
    ]),
    Ciudad('Ciudad B', [
      Sucursal(
        'Sucursal 3',
        [
          Empleado('Carlos', 1200),
        ],
        'Boulevard 789, Ciudad B',
        '+1 222 333 5555',
      ),
    ]),
  ];

  double get ventasTotalesCadena => ciudades.fold(0, (sum, c) => sum + c.ventasTotales);

  double ventasPorCiudad(String nombreCiudad) {
    final ciudad = ciudades.firstWhere((c) => c.nombre == nombreCiudad);
    return ciudad.ventasTotales;
  }

  double ventasPorSucursal(String nombreCiudad, String nombreSucursal) {
    final ciudad = ciudades.firstWhere((c) => c.nombre == nombreCiudad);
    final sucursal = ciudad.sucursales.firstWhere((s) => s.nombre == nombreSucursal);
    return sucursal.ventasTotales;
  }

  double ventasPorEmpleado(String nombreCiudad, String nombreSucursal, String nombreEmpleado) {
    final ciudad = ciudades.firstWhere((c) => c.nombre == nombreCiudad);
    final sucursal = ciudad.sucursales.firstWhere((s) => s.nombre == nombreSucursal);
    final empleado = sucursal.empleados.firstWhere((e) => e.nombre == nombreEmpleado);
    return empleado.ventas;
  }
}
