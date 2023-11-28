import { account_bank } from "../dao/bankdao.js";

export const search_account = async( account ) => {
    if (account.N_tarjeta == 0) {
        throw new Error('El campo de numero de cuenta no esta llenado');
    }
    if (account.emisor == '') {
        throw new Error('El campo de nombre de banco no esta llenado');
    }
    if (account.monto == 0) {
        throw new Error('El campo de monto no tiene un monto');
    }
    if (account.nip == "") {
        throw new Error('El campo de nip no esta llenado');
    }
    
    return await account_bank( account );
}