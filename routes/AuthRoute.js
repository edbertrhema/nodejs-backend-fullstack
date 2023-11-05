import express from "express";
import {
    Login,
    logOut,
    Me
} from "../controllers/Auth.js"
import { RefreshToken } from "../controllers/RefreshToken.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/me', verifyUser ,Me);
router.post('/login', Login);
router.delete('/logout',verifyUser, logOut);
router.get('/token', RefreshToken);

export default router;