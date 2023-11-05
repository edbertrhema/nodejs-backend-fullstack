import Products from "../models/ProductModel.js";
import Users from "../models/UserModel.js";
import {Op} from "sequelize";

export const getProducts = async(req, res) =>{
    try {
        let response;
        //jika role adalah admin, bisa melihat seluruh product
        if(req.role === "admin"){
            response = await Products.findAll({
                attributes:["id","uuid","name","price","userId"],
                include:[{
                    model: Users,
                    attributes:["id","uuid","name","email"]
                }]
            });
        }else{       //jika role adalah user, hanya dapat melihat product yang diinput user itu sendiri
            response = await Products.findAll({
                attributes:["id","uuid","name","price","userId"],
                where:{
                    userId: req.userId
                },
                include:[{
                    model: Users,
                    attributes:["id","uuid","name","email"]
                }]
            });
        }
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const getProductsById = async(req, res) =>{
    try {
        //mencari data di database
        const product = await Products.findOne({
            attributes:["id","uuid","name","price","userId"],
            where:{
                uuid: req.params.id
            },
            include:[{
                model: Users,
                attributes:["id","uuid","name","email"]
            }]
        })
        if(!product) return res.status(404).json({msg:"Product tidak ditemukan"})

        //jika sudah ditemukan maka akan dilakukan validasi untuk menentukan user atau admin yg sedang login
        let response;
        //jika role adalah admin, bisa melihat seluruh product
        if(req.role === "admin"){
            response = await Products.findOne({
                attributes:["id","uuid","name","price","userId"],
                where:{
                    id: product.id
                },    
                include:[{
                    model: Users,
                    attributes:["id","uuid","name","email"]
                }]
            });
        }else{       //jika role adalah user, hanya dapat melihat product yang diinput user itu sendiri
            response = await Products.findOne({
                attributes:["id","uuid","name","price","userId"],
                where:{
                    // operator dimana query id sama dengan id yg dicari, dan userID sama dengan user yang login
                    [Op.and]:[{id: product.id}, {userId: req.userId}]
                },    
                include:[{
                    model: Users,
                    attributes:["id","uuid","name","email"]
                }]
            });
        }

        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({msg:error.message});
    }
}

export const createProducts = async(req, res) =>{
    const {name, price} = req.body;
    try {
        await Products.create({
            name:name,
            price:price,
            userId:req.userId
        });
        res.status(201).json({msg:"Produk berhasil dibuat!"})
        
    } catch (error) {
        res.status(500).json({msg:error.message})
    }
}

export const updateProducts = async(req, res) =>{
    
    try {
        //mencari product di database
        const product = await Products.findOne({
            where:{
                uuid:req.params.id
            }
        });
        if(!product) return res.status(400).json({msg:"Product tidak ditemukan"});
        
        //menambil nilai dari paramater body dan memasukan ke database
        const {name, price} = req.body;
        
        if(req.role === "admin"){
            await Products.update({
                name,
                price
            },{
                where:{
                    id:product.id
                }
            });
        }else{
            // kondisi untuk mengecek apakah idUser product sama tidak dengan user yang login
            if(req.userId !== product.userId) return res.status(403).json({msg: "Akses Terlarang"})
            
            await Products.update({
                name,
                price
            },{
                where:{
                    // operator dimana query id sama dengan id yg dicari, dan userID sama dengan user yang login
                    [Op.and]:[{id: product.id}, {userId: req.userId}]
                }
            });
        }
        res.status(200).json({msg:"Update product berhasil"});
    } catch (error) {
        res.status(400).json({msg:error.message})        
    }


}

export const deleteProducts = async(req, res) =>{
    try {
        //mencari product di database    
        const product = await Products.findOne({
            where:{
                uuid:req.params.id
            }
        });
        if(!product) return res.status(400).json({msg:"Product tidak ditemukan"})

        if(req.role === "admin"){
            await Products.destroy({
                where:{
                    id:product.id
                }
            });
        }else{
            // kondisi untuk mengecek apakah idUser product sama tidak dengan user yang login
            if(req.userId !== product.userId) return res.status(403).json({msg:"Akses Terlarang"})

            await Products.destroy({
                where:{
                    // operator dimana query id sama dengan id yg dicari, dan userID sama dengan user yang login
                    [Op.and]:[{id: product.id}, {userId: req.userId}] // untuk melihat user yang login
                }
            })
        }
        res.status(204).json({msg:"product dihapus"})
    } catch (error) {
        res.status(500).json({msg:error.message})
    }
}