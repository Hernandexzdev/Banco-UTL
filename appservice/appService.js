import { search_account } from "../cqrs/bankcqrs.js";

export const withdrawalmoneyappservice = async( account ) => {
    console.log('withdrawalmoneyappservice ', account);
    const results = await search_account( account );
    return results;
} 