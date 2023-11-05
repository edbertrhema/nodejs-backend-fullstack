import express from "express";
import {
    getUsers,
    getUsersById,
    createUsers,
    updateUsers,
    deleteUsers
} from "../controllers/Users.js"
import { verifyUser, adminOnly } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/users',verifyUser ,getUsers);
router.get('/users/:id',verifyUser ,getUsersById);
router.post('/users', createUsers);
router.patch('/users/:id',verifyUser ,adminOnly ,updateUsers);
router.delete('/users/:id',verifyUser ,adminOnly ,deleteUsers);

export default router;