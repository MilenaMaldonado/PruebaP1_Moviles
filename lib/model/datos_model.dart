class Empleado {
  final String nombre;
  final double ventas;

  Empleado(this.nombre, this.ventas);
}

class Sucursal {

    final String nombre;
  final List<Empleado> empleados;
  final String? direccion; // nullable
  final String? telefono;  // nul
  Sucursal(this.nombre, this.empleados, this.direccion, this.telefono);

  double get ventasTotales => empleados.fold(0, (sum, e) => sum + e.ventas);
}

class Ciudad {
  final String nombre;
  final List<Sucursal> sucursales;

  Ciudad(this.nombre, this.sucursales);

  double get ventasTotales => sucursales.fold(0, (sum, s) => sum + s.ventasTotales);
}
