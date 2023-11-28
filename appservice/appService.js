import { search_account } from "../cqrs/bankcqrs.js";
import axios from "axios";


export const withdrawalmoneyappservice = async( account ) => {
    
    switch (account.emisor) {
        case 'BBVA':
            const results = await search_account( account );
            return results;
            
            case 'Azteca':
                 const prueba= axios.post('http://192.168.56.1/CajeroBancoAzteca/api/retiro/save');
                 console.log(prueba);
                 return prueba
                break;
            case 'Coppel':
                // axios.post();
              
                    break;
            case 'Bienestar':
                // axios.post();
                  
                        break;
    
        default:
            console.log("No se encontro el banco que ingreso");
            break;
    }
    
} 