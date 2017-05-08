drop table Tiquete;
drop table Reservacion;
drop table Asiento;
drop table Viaje;
drop table Avion;
drop table Vuelo;
drop table Ciudad;
drop table Pasajero;
drop table Usuario;
Create table Usuario(
    nombreUsuario varchar(20) NOT NULL,
    contrasena varchar(20) NOT NULL,
    correo varchar(20) NOT NULL,
    nombre varchar(20),
    apellido1 varchar(20),
    apellido2 varchar(20),
    longDireccion varchar(20),
    latDireccion varchar(20),
    telefono number,
    celular number,
    constraint pkUsuario primary key(nombreUsuario)
);

Create table Pasajero(
    cedula number NOT NULL,
    nombre varchar(20),
    nombre_usuario varchar(20),
    pasaporte number,
    constraint fkPasajero foreign key (nombre_usuario) references Usuario,
    constraint pkPasajero primary key(cedula)
);
Create table Ciudad(
    pais varchar(20) NOT NULL,
    nombre varchar(20) NOT NULL,
    constraint pkCiudad primary key(nombre)
);
create table Vuelo(
    tiempoVuelo varchar(20),
    numeroVuelo number,
    nombre_ciudad1 varchar(20),
    nombre_ciudad2 varchar(20),
    constraint fkVuelo1 foreign key (nombre_ciudad1) references Ciudad,
    constraint fkVuelo2 foreign key (nombre_ciudad2) references Ciudad,
    constraint pkVuelo primary key(numeroVuelo)
);
Create table Avion(
    placa varchar(20) NOT NULL,
    modelo varchar(20) NOT NULL,
    marca varchar(20) NOT NULL,
    anno number,
    numeroAsientos number,
    asientosPorFila number,
    numeroFilas number,
    constraint pkAvion primary key(placa)
);
Create table Viaje(
    numeroViaje number NOT NULL,
    placa_avion varchar(20) NOT NULL,
    numero_vuelo number,
    constraint fkViaje1 foreign key (placa_avion) references Avion,
    constraint fkViaje2 foreign key (numero_vuelo) references Viaje,
    constraint pkViaje primary key(numeroViaje)
);
Create table Asiento(
    codigo number NOT NULL,
    numero number NOT NULL,
    estado varchar(20),
    numero_viaje number NOT NULL,
    constraint fkAsiento foreign key (numero_viaje) references Viaje,
    constraint pkAsiento primary key(codigo)
);

Create table Reservacion(
    codigo number NOT NULL,
    fechaIda varchar(20) NOT NULL,
    fechaRegreso varchar(20),
    numero_viaje1 number NOT NULL,
    numero_viaje2 number,
    cedula_pasajero number,
    codigo_asiento number NOT NULL,
    constraint fkReservacion1 foreign key (cedula_pasajero) references Pasajero,
    constraint fkReservacion2 foreign key (numero_viaje1) references Viaje,
    constraint fkReservacion3 foreign key (numero_viaje2) references Viaje,
    constraint fkReservacion4 foreign key (codigo_asiento) references Asiento,
    constraint pkReservacion primary key(codigo)
);
Create table Tiquete(
    codigo number NOT NULL,
    numeroAsiento number NOT NULL,
    codigo_reservacion number NOT NULL,
    constraint fkTiquete foreign key (codigo_reservacion) references Reservacion,
    constraint pkTiquete primary key(codigo)
);
commit;