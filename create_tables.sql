CREATE TABLE Utente (  
	CF VARCHAR(16) primary key,  
	Nome VARCHAR(30) not null unique, 
	Indirizzo VARCHAR(50) not null, 
	Email VARCHAR(30) not null unique, 
	Password VARCHAR(30) not null, 
	CHECK (LENGTH(Nome) >= 6),  
	CHECK (LENGTH(Password) >= 6) 
); 

CREATE TABLE Magazzino ( 
	CodiceMagazzino INTEGER primary key,
	Indirizzo VARCHAR(255)
);

CREATE TABLE Reparto ( 
	CodiceReparto INTEGER primary key,
	CodiceMagazzino INTEGER not null,
	Foreign key CodiceMagazzino references(Magazzino),  
);

CREATE TABLE Scaffale ( 
	CodiceScaffale INTEGER primary key,
	CodiceReparto INTEGER not null,
	Foreign key CodiceReparto references(Reparto),  
);

CREATE TABLE Cateogria ( 
	CodiceCategoria INTEGER primary key,
	NomeCategoria VARCHAR(255) not null,
);

CREATE TABLE Prodotto ( 
 	CodiceProdotto INTEGER primary key, 
 	NomeProdotto VARCHAR(30) not null, 
 	Marca VARCHAR(30) not null, 
 	Prezzo NUMERIC(10,2) not null, 
 	CodiceScaffale INTEGER not null, 
 	QuantitàRimanente INTEGER not null, 
 	NomeCategoria VARCHAR(30) not null, 
	Fornitore VARCHAR(30) not null, 
	Foreign key CodiceScaffale references(Scaffale),  
	Foreign key CodiceCategoria references(Categoria), 
	CHECK (QuantitàRimanente>= 0),  
	CHECK (Prezzo > 0)
); 

CREATE TABLE CodiceCarrello ( 
	CodiceCategoria INTEGER primary key,
	NomeCategoria VARCHAR(255) not null,
);