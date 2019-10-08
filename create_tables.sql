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

CREATE TABLE Categoria ( 
	CodiceCategoria INTEGER primary key,
	NomeCategoria VARCHAR(255) not null
);

CREATE TABLE Carta(
	NumeroCarta INTEGER primary key,
	Scadenza date not null,
	CodiceNumericoDiSicurezza INTEGER not null
);

CREATE TABLE Carello(
	CodiceCarrello INTEGER not null,
	PrezzoTotale DECIMAL not null
);

CREATE TABLE ProdottoCarrello(
	CodiceCarrello INTEGER primary key not null, 
	CodiceProdotto INTEGER not null references Prodotto (CodiceProdotto), 
	quantità INTEGER not null
);

CREATE TABLE MetodoDiPagamento(
	CF VARCHAR(16) not null unique,
	NumeroCarta INTEGER not null unique,
	PRIMARY KEY(CF,NumeroCarta)
);

CREATE TABLE Furgone(
	Targa VARCHAR(7) not null PRIMARY KEY, 
	MetodoDiCarburazione VARCHAR(20), 
	ScadenzaAssicurazione date not null
);

CREATE TABLE Corriere(
	Targa VARCHAR(7) not null unique references Furgone(Targa),
	Data date not null unique,
	CodiceFiscale VARCHAR(16) not null, 
	PRIMARY KEY(Targa,Data)
);

CREATE TABLE Spedizione(
	CodiceSpedizione INTEGER not null PRIMARY KEY,
	Targa VARCHAR(7) not null references Corriere(Targa),
	Data date not null references Corriere(Data),
	CodiceSpedizioneRiprovata date not null references Spedizione
);

CREATE TABLE Acquisto(
	CodiceAcquisto INTEGER not null PRIMARY KEY,
	CF VARCHAR(16) not null references MetodoDiPagamento(CF),
	NumeroCarta INTEGER not null references MetodoDiPagamento(NumeroCarta),
	CodiceSpedizione INTEGER not null references Spedizione(CodiceSpedizione)
);


