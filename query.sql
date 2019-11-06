/*Dato un prodotto la cui QuantitàRimanente è minore di 10, restituire scaffale e reparto. */

SELECT CodiceScaffale, CodiceReparto  

FROM Scaffale as S 

INNER JOIN Prodotto ON S.CodiceScaffale=Prodotto.CodiceScaffale  

AND QuantitàRimanente<10  

 

/*Quali prodotti nella categoria 'elettrodomestici' sono stati acquistati dall'utente Rossi Luigi. */

  

SELECT * FROM prodotto  

INNER JOIN acquistoprodotto ON acquistoprodotto.codiceprodotto = prodotto.codiceprodotto 

INNER JOIN acquisto ON acquistoprodotto.codiceacquisto = acquisto.codiceacquisto 

INNER JOIN utente ON acquisto.cf = utente.cf 

INNER JOIN categoria ON prodotto.codicecategoria = categoria.codicecategoria 

WHERE categoria.nomecategoria = 'elettrodomestici' AND utente.nome = 'Rossi Luigi' 

 

/*Quali utenti hanno acquistato tutti i prodotti nella categoria 'elettrodomestici' */

  

SELECT * FROM utente U 

WHERE NOT EXISTS ( 

  SELECT * FROM prodotto P 

  INNER JOIN acquistoprodotto ON acquistoprodotto.codiceprodotto = P.codiceprodotto 

  INNER JOIN acquisto ON acquistoprodotto.codiceacquisto = acquisto.codiceacquisto 

  INNER JOIN utente U2 ON acquisto.cf = U2.cf 

  WHERE U2.cf = U.cf AND NOT EXISTS ( 

    SELECT * FROM prodotto P2 

    INNER JOIN categoria ON P2.codicecategoria = categoria.codicecategoria 

    WHERE P2.codiceprodotto = P.codiceprodotto AND categoria.nomecategoria = 'elettrodomestici' 

  ) 

) 