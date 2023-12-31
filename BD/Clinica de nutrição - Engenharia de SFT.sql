DROP TABLE IF EXISTS Usuarios CASCADE;
DROP TABLE IF EXISTS Tipos_Usuarios CASCADE;

create table Tipos_Usuarios (
tipo_Usuario_ID SERIAL PRIMARY KEY,
tipo_Usuario_Nome varchar(50) not null
);

create table Usuarios (
user_ID SERIAL PRIMARY KEY,
user_Name varchar(50) not null,
user_Senha varchar(50) not null,
cpf varchar (50) not null,
tipo_Usuario_ID int,
FOREIGN KEY (tipo_Usuario_ID) references Tipos_Usuarios(tipo_Usuario_ID)
);

INSERT INTO Tipos_Usuarios (tipo_Usuario_Nome) VALUES
    ('Recepcionista'),
    ('Medico'),
    ('Administrador'),
    ('Paciente');

INSERT INTO Usuarios (user_Name, user_Senha, cpf, tipo_Usuario_ID)
SELECT 'admin', 'admin', '00000000000', (SELECT tipo_Usuario_ID FROM Tipos_Usuarios WHERE tipo_Usuario_Nome = 'Administrador')
