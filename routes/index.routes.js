import { Router } from "express";
import { banco } from "../controller/index.js";
const router = Router();

router.get('/banco', banco);

export default router;