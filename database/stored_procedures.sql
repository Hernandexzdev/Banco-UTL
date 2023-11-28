DELIMITER //

CREATE PROCEDURE RegistrarTransaccion (
    IN n_tarjeta INT,
    IN emisor VARCHAR(50),
    IN monto INT,
    IN nip_cp INT
    
)
BEGIN
    DECLARE exito BOOLEAN DEFAULT TRUE;
    DECLARE nuevo_folio VARCHAR(50);
    DECLARE nuevo_monto INT;
    DECLARE msg VARCHAR(255);
    DECLARE msg1 varchar(255);
    DECLARE Cuenta VARCHAR(150);
    DECLARE tarjeta VARCHAR(4) DEFAULT 0;
    DECLARE nip_p Varchar(4)DEFAULT 0;
    DECLARE cantidad_1 INT;
    DECLARE cantidad_2 INT;
    -- Inicia la transacción
    START TRANSACTION;

    -- Genera un nuevo folio utilizando una secuencia
    SET nuevo_folio = CONCAT(
        CHAR(FLOOR(RAND() * 26) + 65), -- Primera letra
        CHAR(FLOOR(RAND() * 26) + 65), -- Segunda letra
        LPAD(monto, 3, '0') -- Tres números con relleno a la izquierda
    );


	SELECT Nip INTO nip_p FROM banco WHERE Nip = nip_cp;  
	SELECT Numero_Tarjeta, Cantidad_cuenta INTO tarjeta, Cuenta FROM banco WHERE Numero_Tarjeta = n_tarjeta;
    select Cantidad_cajero INTO nuevo_monto from cajero where id_cajero = 1;
    
    IF tarjeta = 0 THEN 
	SET exito = FALSE;
	END IF;
    
    IF exito THEN
    
		IF nip_p = 0 THEN 
		SET exito = FALSE;
		END IF;
        
        
		IF exito THEN
			IF monto > Cuenta OR Cuenta = 0 THEN
			SET exito = FALSE;
			END IF;
            
            IF exito THEN
				IF monto > nuevo_monto OR nuevo_monto = 0 THEN
				SET exito = FALSE;
				END IF;
                
                IF exito THEN
				
					IF exito THEN
					COMMIT;
						SET cantidad_1 = Cuenta - monto;
						UPDATE banco SET Cantidad_cuenta = cantidad_1 WHERE Numero_Tarjeta = n_tarjeta;
						SET cantidad_2 = nuevo_monto - monto;
						UPDATE cajero SET Cantidad_cajero = cantidad_2 WHERE id_cajero = 1;
						INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "Transacción exitosa.");
						SET msg  = 'Transacción exitosa.';
						select msg, nuevo_folio ;
					ELSE
				   ROLLBACK;
						INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "La transacción no se procesó.");
						SET msg  = "La transacción no se procesó.";
						select msg, nuevo_folio;
					END IF;
					
				ELSE
					SET msg = "No hay suficiente dinero en el cajero.";
					SELECT msg;
				END IF;
			ELSE
			SET msg = "No tienes suficiente saldo.";
            SELECT msg;
			END IF;
		ELSE
		SET msg = "Nip incorreto.";
        SELECT msg;
		END IF;
	ELSE
		SET msg = "No se encontro la cuenta.";
        SELECT msg;
	END IF;
	
   


    
    END //
DELIMITER ;

call RegistrarTransaccion("4555", "BBVA", 10, "123");
use banco;
drop procedure RegistrarTransaccion;