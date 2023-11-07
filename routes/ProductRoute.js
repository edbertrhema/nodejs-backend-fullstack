import express from "express";
import {
    getProducts,
    getProductsById,
    createProducts,
    updateProducts,
    deleteProducts
} from "../controllers/Products.js"
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/api/products',verifyUser, getProducts);
router.get('/api/products/:id',verifyUser, getProductsById);
router.post('/api/products/',verifyUser, createProducts);
router.patch('/api/products/:id',verifyUser, updateProducts);
router.delete('/api/products/:id',verifyUser, deleteProducts);

export default router;