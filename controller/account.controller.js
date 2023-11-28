import { withdrawalmoneyappservice } from "../appservice/appService.js";

export const bank_account = async(req, res) =>{
    console.log(req.body);

    const [results] = await withdrawalmoneyappservice( req.body );
    console.log( results);
          res.render('banco',{msg: results.msg, codigo: results.nuevo_folio});
   

}