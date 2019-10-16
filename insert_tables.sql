INSERT INTO public.utente(
	cf, nome, indirizzo, email, password)
	VALUES ('moimln98s05c816p', 'rossi luigi', 'via manzoni', 'rossiluigi@gmail.com', 'ciao1234');
	
INSERT INTO public.utente(
	cf, nome, indirizzo, email, password)
	VALUES ('nskeic76w34v8160', 'verdi mario', 'via carducci', 'verdimario@gmail.com', 'sedia1234');
	
INSERT INTO public.utente(
	cf, nome, indirizzo, email, password)
	VALUES ('msyejd87f87k789p', 'gialli gianni', 'via dante', 'galligianni@gmail.com', 'candelabro32');



INSERT INTO public.magazzino(
	codicemagazzino, indirizzo)
	VALUES (123, 'via trento trieste');

INSERT INTO public.magazzino(
	codicemagazzino, indirizzo)
	VALUES (143, 'via forlì');



INSERT INTO public.reparto(
	codicereparto, codicemagazzino)
	VALUES (243, 123);

INSERT INTO public.reparto(
	codicereparto, codicemagazzino)
	VALUES (255, 123);
	
INSERT INTO public.reparto(
	codicereparto, codicemagazzino)
	VALUES (284, 143);
	
INSERT INTO public.reparto(
	codicereparto, codicemagazzino)
	VALUES (217, 143);
	
	
	
INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (11, 243, 150);

INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (15, 243, 150);
	
INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (12, 255, 150);
	
INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (16, 255, 150);

INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (8, 284, 150);
	
INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (9, 284, 150);

INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (20, 217, 150);

INSERT INTO public.scaffale(
	codicescaffale, codicereparto, capienza)
	VALUES (21, 217, 150);
	
	
	
INSERT INTO public.categoria(
	codicecategoria, nomecategoria)
	VALUES (1000, 'tecnologia');

INSERT INTO public.categoria(
	codicecategoria, nomecategoria)
	VALUES (2000, 'vestiti');
	
INSERT INTO public.categoria(
	codicecategoria, nomecategoria)
	VALUES (3000, 'mobilio');
	
	
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12345, 'computer', 'lenovo', 500, 11, 5, 1000, 'lenovo');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12346, 'computer', 'dell', 654, 11, 3, 1000, 'dell');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12375, 'jeans', 'levis', 78, 15, 32, 2000, 'levis');

INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12376, 'cappello', 'vans', 35, 12, 12, 2000, 'vans');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (45126, 'sedia', 'ikea', 45, 16, 54, 3000, 'ikea');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12378, 'telefono', 'samsung', 800, 8, 47, 1000, 'samsung');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (45634, 'divano', 'poltronesofà', 765, 9, 21, 3000, 'poltronesofà');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12384, 'camicia', 'gucci', 900, 20, 13, 2000, 'gucci');

INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (12392, 'telefono', 'apple', 920, 21, 74, 1000, 'apple');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (45238, 'giacca', 'hollister', 320, 20, 46, 2000, 'hollister');
	
INSERT INTO public.prodotto(
	codiceprodotto, nomeprodotto, marca, prezzo, codicescaffale, "quantitàrimanente", codicecategoria, fornitore)
	VALUES (91517, 'tavolo', 'scavolini', 254, 16, 61, 3000, 'scavolini');
	


INSERT INTO public.carta(
	numerocarta, scadenza, codicenumericodisicurezza)
	VALUES (1234567891, '2021-01-01', 123);
	
INSERT INTO public.carta(
	numerocarta, scadenza, codicenumericodisicurezza)
	VALUES (1346798526, '2022-03-03', 456);
	
	
	
INSERT INTO public.carrello(
	codicecarrello, prezzototale)
	VALUES (1, 1820);
	
INSERT INTO public.carrello(
	codicecarrello, prezzototale)
	VALUES (2, 80);
	
	
INSERT INTO public.prodottocarrello(
	codicecarrello, codiceprodotto, "quantità")
	VALUES (1, 12392, 1);

INSERT INTO public.prodottocarrello(
	codicecarrello, codiceprodotto, "quantità")
	VALUES (1,12384, 1);

INSERT INTO public.prodottocarrello(
	codicecarrello, codiceprodotto, "quantità")
	VALUES (2,12376, 1);
	
INSERT INTO public.prodottocarrello(
	codicecarrello, codiceprodotto, "quantità")
	VALUES (2,45126, 1);
	
	

INSERT INTO public.metododipagamento(
	cf, numerocarta)
	VALUES ('moimln98s78c789r', 1234567891);
	
INSERT INTO public.metododipagamento(
	cf, numerocarta)
	VALUES ('mdluln98s78c789r', 1346798526);
	
	
	
INSERT INTO public.furgone(
	targa, metododicarburazione, scadenzaassicurazione)
	VALUES ('to150re', 'benzina', '2023-03-03');

INSERT INTO public.furgone(
	targa, metododicarburazione, scadenzaassicurazione)
	VALUES ('ro130mi', 'diesel', '2021-04-04');
	
	
	
	
INSERT INTO public.autista(
	codicefiscale, numeropatente, nome, cognome, numerotelefono)
	VALUES ('mdslln88s78c789r', 10, 'Giacomo', 'Tadini', 3332545845);

INSERT INTO public.autista(
	codicefiscale, numeropatente, nome, cognome, numerotelefono)
	VALUES ('mvsssn88s78g789r', 11, 'Luca', 'Geliti', 3342533845);
	
	
	
	
INSERT INTO public.corriere(
	targa, data, codicefiscale)
	VALUES ('ro130mi', '2020-03-03', 'mdslln88s78c789r');

INSERT INTO public.corriere(
	targa, data, codicefiscale)
	VALUES ('to150re', '2020-07-08', 'mvsssn88s78g789r');
	
	


INSERT INTO public.spedizione(
	codicespedizione, targa, data, codicespedizioneriprovata)
	VALUES (66, 'ro130mi', '2020-03-03', null);
	
INSERT INTO public.spedizione(
	codicespedizione, targa, data, codicespedizioneriprovata)
	VALUES (67, 'to150re', '2020-07-08', null);
	



INSERT INTO public.acquisto(
	codiceacquisto, cf, numerocarta, codicespedizione)
	VALUES (88, 'moimln98s78c789r', 1234567891, 66);
	
INSERT INTO public.acquisto(
	codiceacquisto, cf, numerocarta, codicespedizione)
	VALUES (89, 'mdluln98s78c789r', 1346798526, 67);

	
	

INSERT INTO public.acquistoprodotto(
	codiceprodotto, codiceacquisto, "quantità")
	VALUES (12375, 88, 1);
	
INSERT INTO public.acquistoprodotto(
	codiceprodotto, codiceacquisto, "quantità")
	VALUES (12376, 89, 1);
	
	
	
	
INSERT INTO public.tecnico(
	codicefiscale, nome, cognome, numerotelefono, specializzazione)
	VALUES ('qifjcu98s78c852r', 'Marco', 'Gerra', '3425698458', 'informatico');
	
INSERT INTO public.tecnico(
	codicefiscale, nome, cognome, numerotelefono, specializzazione)
	VALUES ('spleuf98s78c452r', 'Luca', 'Artorias', '3215878956', 'mobilio');	
	
	
	
	
INSERT INTO public.magazziniere(
	codicefiscale, matricolamagazziniere, nome, cognome, numerotelefono)
	VALUES ('qrfjdu92s72c852e', 74, 'Stefano', 'Rivoli', '3894562812');
	
INSERT INTO public.magazziniere(
	codicefiscale, matricolamagazziniere, nome, cognome, numerotelefono)
	VALUES ('eighti93t34c872r', 75, 'Pietro', 'Perelli', '3665873254');	
	
	
	
	
INSERT INTO public.turno(
	codicefiscale, giorno)
	VALUES ('qrfjdu92s72c852e', '2019-06-06');

INSERT INTO public.turno(
	codicefiscale, giorno)
	VALUES ('eighti93t34c872r', '2019-06-07');
	