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