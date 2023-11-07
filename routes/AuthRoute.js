import express from "express";
import {
    Login,
    logOut,
    Me
} from "../controllers/Auth.js"
import { RefreshToken } from "../controllers/RefreshToken.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/api/me', verifyUser ,Me);
router.post('/api/login', Login);
router.delete('/api/logout',verifyUser, logOut);
router.get('/api/token', RefreshToken);

export default router;