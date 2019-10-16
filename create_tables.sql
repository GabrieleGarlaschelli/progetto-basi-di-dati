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
	CodiceReparto INTEGER REFERENCES Reparto(CodiceReparto),
	capienza INTEGER not null
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

CREATE TABLE Carta(
	NumeroCarta INTEGER primary key,
	Scadenza date not null,
	CodiceNumericoDiSicurezza INTEGER not null
);

CREATE TABLE Carrello(
	CodiceCarrello INTEGER not null PRIMARY KEY,
	PrezzoTotale DECIMAL not null
);

CREATE TABLE ProdottoCarrello(
	CodiceCarrello INTEGER not null references Carrello(CodiceCarrello),
	CodiceProdotto INTEGER not null references Prodotto (CodiceProdotto), 
	quantità INTEGER not null, 
	PRIMARY KEY(CodiceCarrello,CodiceProdotto)
);

CREATE TABLE MetodoDiPagamento(
	CF VARCHAR(16) not null unique,
	NumeroCarta INTEGER not null unique references Carta(NumeroCarta),
	PRIMARY KEY(CF,NumeroCarta)
);

CREATE TABLE Furgone(
	Targa VARCHAR(7) not null PRIMARY KEY, 
	MetodoDiCarburazione VARCHAR(20), 
	ScadenzaAssicurazione date not null
);

CREATE TABLE Autista(
CodiceFiscale VARCHAR(16) not null PRIMARY KEY,
NumeroPatente INTEGER not null unique,
Nome VARCHAR(25) not null,
Cognome VARCHAR(25) not null,
NumeroTelefono VARCHAR(10)
);

CREATE TABLE Corriere(
	Targa VARCHAR(7) not null unique references Furgone(Targa),
	Data date not null unique,
	CodiceFiscale VARCHAR(16) not null references Autista(CodiceFiscale),
	PRIMARY KEY(Targa,Data)
);

CREATE TABLE Spedizione(
	CodiceSpedizione INTEGER not null PRIMARY KEY,
	Targa VARCHAR(7) not null references Corriere(Targa),
	Data date not null references Corriere(Data),
	CodiceSpedizioneRiprovata INTEGER references Spedizione
);

CREATE TABLE Acquisto(
	CodiceAcquisto INTEGER not null PRIMARY KEY,
	CF VARCHAR(16) not null references MetodoDiPagamento(CF),
	NumeroCarta INTEGER not null references MetodoDiPagamento(NumeroCarta),
	CodiceSpedizione INTEGER references Spedizione(CodiceSpedizione)
);

CREATE TABLE AcquistoProdotto(
CodiceProdotto INTEGER not null PRIMARY KEY references Prodotto (CodiceProdotto),
CodiceAcquisto INTEGER not null references Acquisto(CodiceAcquisto),
Quantità INTEGER not null
);

CREATE TABLE Tecnico(
CodiceFiscale VARCHAR(16) not null PRIMARY KEY,
Nome VARCHAR(25) not null,
Cognome VARCHAR(25) not null,
NumeroTelefono VARCHAR(10),
Specializzazione VARCHAR(25) not null
);

CREATE TABLE Magazziniere(
CodiceFiscale VARCHAR(16) not null PRIMARY KEY,
MatricolaMagazziniere INTEGER not null unique,
Nome VARCHAR(25) not null,
Cognome VARCHAR(25) not null,
NumeroTelefono VARCHAR(10)
);


CREATE TABLE Turno(
CodiceFiscale VARCHAR(16) not null unique references Magazziniere(CodiceFiscale),
Giorno date not null unique, 
PRIMARY KEY(CodiceFiscale,Giorno)
);
