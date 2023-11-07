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

router.get('/api/users',verifyUser ,getUsers);
router.get('/api/users/:id',verifyUser ,getUsersById);
router.post('/api/users', createUsers);
router.patch('/api/users/:id',verifyUser ,adminOnly ,updateUsers);
router.delete('/api/users/:id',verifyUser ,adminOnly ,deleteUsers);

export default router;