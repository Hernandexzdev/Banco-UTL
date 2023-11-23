DELIMITER //

CREATE PROCEDURE RegistrarTransaccion (
    IN n_tarjeta INT,
    IN emisor VARCHAR(50),
    IN monto INT,
    IN nip VARCHAR(4)
    
)
BEGIN
    DECLARE exito BOOLEAN DEFAULT TRUE;
    DECLARE nuevo_folio VARCHAR(50);
    DECLARE nuevo_monto INT;
    DECLARE msg1 VARCHAR(50);
    DECLARE msg2 VARCHAR(50);
    DECLARE msg3 VARCHAR(50);
    DECLARE msg4 VARCHAR(50);
    DECLARE cuenta VARCHAR(150);
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

	-- Verificamos si el cajero tiene dineor
        select Cantidad INTO nuevo_monto from cajero where id_cajero = 1;
    
    -- Simula una condición de error si el monto es menor a 0
    IF monto > nuevo_monto or nuevo_monto = 0 THEN
        SET exito = FALSE;
    END IF;

    -- Finaliza la transacción
    IF exito THEN
        COMMIT;
		    -- Verificamos que si exita la cuneta 
			SELECT Cantidad INTO Cuenta FROM banco WHERE banco_emisor = emisor and Numero_Tarjeta = n_tarjeta;
			
			IF monto > cantidad or Cuenta = 0 THEN
			SET exito = FALSE;
			END IF;
			
			IF exito THEN
				
				COMMIT;
				
				SET cantidad_1 = Cuenta - monto;
				UPDATE banco SET Cantidad = cantidad_1 WHERE Numero_Tarjeta = n_tarjeta;
                SET cantidad_2 = nuevo_monto - monto;
                UPDATE cajero SET Cantidad = cantidad_2 WHERE id_cajero = 1;
				INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "Transacción exitosa.");
				SET msg1  = "Transaccion Exitosa";
                select msg1;
			ELSE
				
				ROLLBACK;
				
				INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "La transacción no se procesó.");
				SET msg1  = "La transacción no se procesó.";
                select msqg1;
			END IF;
    
        
    ELSE
		
        ROLLBACK;
        
        INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "La transacción no se procesó.");
		SET msg3 = "El cajero no tiene suficiente dinero";
        SELECT msg3;
    END IF;


    

END //

DELIMITER ;

call RegistrarTransaccion(4555, "BBVA", 700, "1234");


use banco;
drop procedure RegistrarTransaccion;