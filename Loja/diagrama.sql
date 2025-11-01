create database if not exists Loja;
use Loja;



create table Estado(
	ID int primary key auto_increment,
    Nome varchar(100) not null,
    UF varchar(2) not null
);

create table Municipio(
	ID int primary key auto_increment,
    FK_EstadoID int not null,
    Nome varchar(100) not null,
    CodIBGE int not null,
    foreign key (FK_EstadoID) references Estado(ID)
);


create table Cliente(
	ID int primary key auto_increment,
    Nome varchar(80) not null,
    CPF char(11) not null,
    Celular char(11),
    EndLogradouro varchar(100) not null,
    EndNumero varchar(10) not null,
    EndMunicipio int not null,
    EndCEP char(8),
    FK_Municipio_ID int not null,
    foreign key (FK_Municipio_ID) references Municipio(ID)
);

create table ContaReceber(
	ID int primary key auto_increment,
    FK_Cliente_ID int not null,
    FaturaVendaID int,
    DataConta date not null,
    DataVencimento date not null,
    Valor decimal(18,2) not null,
    Situacao enum('1','2','3') not null,
    foreign key (FK_Cliente_ID) references Cliente(ID)
);