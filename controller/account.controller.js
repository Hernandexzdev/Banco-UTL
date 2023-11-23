import { withdrawalmoneyappservice } from "../appservice/appService.js";

export const bank_account = async(req, res) =>{
    console.log( req.body );
    const [results] = await withdrawalmoneyappservice( req.body );
    res.status(200).json(  results  );
}