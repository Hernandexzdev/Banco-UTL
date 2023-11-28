import { Router } from "express";
import { banco, index } from "../controller/index.controller.js";
const router = Router();

router.get('/banco', banco);
router.get('/index', index);

export default router;