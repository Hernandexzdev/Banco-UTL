DELIMITER //

CREATE PROCEDURE RegistrarTransaccion (
    IN monto_banco INT,
    IN 
    
)
BEGIN
    DECLARE exito BOOLEAN DEFAULT TRUE;
    DECLARE nuevo_folio VARCHAR(50);
    DECLARE monto_cajero INT;
    DECLARE tarjeta INT,

    -- Inicia la transacción
    START TRANSACTION;

    -- Genera un nuevo folio utilizando una secuencia
    SET nuevo_folio = CONCAT(ß
        CHAR(FLOOR(RAND() * 26) + 65), -- Primera letra
        CHAR(FLOOR(RAND() * 26) + 65), -- Segunda letra
        LPAD(monto_banco, 3, '0') -- Tres números con relleno a la izquierda
    );

    -- Inserta la transacción con el nuevo folio
    select Cantidad INTO monto_cajero from cajero where id_cajero = 1;
    select Cantidad INTO monto_tarjeta from banco where Numero_Tarjeta = 

    -- Simula una condición de error si el monto es menor a 100
    IF monto_banco > monto_cajero THEN
        SET exito = FALSE;
        IF 
    END IF;

    -- Finaliza la transacción
    IF exito THEN
        COMMIT;
        select Cantidad INTO nuevo_monto from cajero where Ban = 1;
        INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "Transacción exitosa.");
    ELSE
        ROLLBACK;
        INSERT INTO registro_transaccion(codigo, registro_T) values(nuevo_folio, "La transacción no se procesó, no hay suficiente dinero en el cajero");
        
    END IF;
END //

DELIMITER ;

call RegistrarTransaccion(110);