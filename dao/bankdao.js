import { pool } from "../database/mysql.js";

export const account_bank = async( account ) => {
    console.log('account_bank ', account);
    const [results] =  await pool.query('CALL RegistrarTransaccion(?, ?, ?, ?);', [account.N_tarjeta, account.emisor, account.monto, account.nip]);

    return results[0];
}