-- trigger per il controllo della quantità rimanente prima di essere aggiunti al carrello


CREATE OR REPLACE FUNCTION controllo_quantità()  
RETURNS trigger AS $controllo_quantità$  
BEGIN 
	IF NEW.quantità>  
	(select QuantitàRimanente 
	from Prodotto 
	where Prodotto.codiceprodotto = NEW.codiceprodotto)  
	THEN	 
	RAISE EXCEPTION 'Non abbastanza prodotti rimanenti per essere aggiunti al carrello';  
	END IF ; 
	RETURN NEW ;  
END; 
$controllo_quantità$ LANGUAGE plpgsql;


CREATE TRIGGER controllo_quantità BEFORE INSERT ON ProdottoCarrello FOR EACH ROW 
EXECUTE PROCEDURE controllo_quantità(); 


-- trigger per il controllo capienza nello scaffale prima della modifica della quantità nel prodotto 


CREATE OR REPLACE FUNCTION capienza_occupata(integer) RETURNS integer AS $capienza_occupata$  
	DECLARE     
		codice_scaffale ALIAS FOR $1; 
	BEGIN  
		RETURN (SELECT SUM(prodotto.quantitàrimanente) from prodotto 
			WHERE prodotto.codicescaffale = codice_scaffale
			GROUP BY prodotto.codicescaffale);  
	END;  
$capienza_occupata$ LANGUAGE plpgsql;

 

CREATE OR REPLACE FUNCTION capienza_rimanente(integer) RETURNS integer AS $capienza_rimanente$  
	DECLARE 
		codice_scaffale ALIAS FOR $1; 
		scaffale_row scaffale%ROWTYPE; 
	BEGIN  
		SELECT * INTO scaffale_row from scaffale 
		WHERE scaffale.codicescaffale = codice_scaffale;
		return scaffale_row.capienza - capienza_occupata(codice_scaffale);
	END;
$capienza_rimanente$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION controllo_capienza() 
RETURNS TRIGGER AS $controllo_capienza$ 
BEGIN 
	IF NEW.quantitàrimanente > capienza_rimanente(NEW.codicescaffale) THEN 
	RAISE EXCEPTION 'Poco spazio sullo scaffale'; END IF ;  
	RETURN NEW; 
END 
$controllo_capienza$ LANGUAGE plpgsql; 


CREATE TRIGGER controllo_capienza BEFORE INSERT OR UPDATE ON Prodotto FOR EACH ROW 
EXECUTE PROCEDURE controllo_capienza();