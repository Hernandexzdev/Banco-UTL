import { Router } from "express";
import { banco } from "../controller/index.controller.js";
const router = Router();

router.get('/banco', banco);

export default router;