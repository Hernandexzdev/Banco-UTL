import { Router } from "express";
import { bank_account } from "../controller/account.controller.js";
const router = Router();

router.post("/withdrawal", bank_account);

export default router;
