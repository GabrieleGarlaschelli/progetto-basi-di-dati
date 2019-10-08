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
	CodiceMagazzino INTEGER REFERENCES Magazzino(CodiceMagazzino)
);

CREATE TABLE Scaffale ( 
	CodiceScaffale INTEGER primary key,
	CodiceReparto INTEGER REFERENCES Reparto(CodiceReparto)
);

CREATE TABLE Categoria( 
	CodiceCategoria INTEGER primary key,
	NomeCategoria VARCHAR(255) not null
);

CREATE TABLE Prodotto ( 
 	CodiceProdotto INTEGER primary key, 
 	NomeProdotto VARCHAR(30) not null, 
 	Marca VARCHAR(30) not null, 
 	Prezzo NUMERIC(10,2) not null, 
 	CodiceScaffale INTEGER references Scaffale (CodiceScaffale),
 	QuantitàRimanente INTEGER not null, 
 	CodiceCategoria INTEGER references Categoria (CodiceCategoria),
	Fornitore VARCHAR(30) not null, 
	CHECK (QuantitàRimanente>= 0),  
	CHECK (Prezzo > 0)
); 

CREATE TABLE CodiceCarrello ( 
	CodiceCategoria INTEGER primary key,
	NomeCategoria VARCHAR(255) not null
);