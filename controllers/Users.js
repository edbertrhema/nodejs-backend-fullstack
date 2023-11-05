import Users from "../models/UserModel.js";
import argon2 from "argon2";

export const getUsers = async(req, res) =>{

    try{
        const response = await Users.findAll({
            attributes:['id','uuid','name','email','role']
        });
        res.status(200).json(response);
    } catch(error){
        res.status(500).json({msg:error.message});
    }

}

export const getUsersById = async(req, res) =>{

    try{
        const response = await Users.findOne({
            attributes:['id','uuid','name','email','role'],
            where: {
                uuid: req.params.id
            }
        });
        res.status(200).json(response);
    } catch(error){
        res.status(500).json({msg:error.message});
    }

    
}

export const createUsers = async(req, res) =>{

    const {name, email, password, confPassword, role} = req.body;
    if(password != confPassword) return res.status(400).json({msg:"Password dan Confirm Password berbeda"})
    const hashPassword = await argon2.hash(password);

    try{
        await Users.create({
            name: name,
            email: email,
            password: hashPassword,
            role:role

        });
        res.status(200).json({msg:"Register Berhasil"});
    } catch(error){
        res.status(400).json({msg:error.message});
    }

    
}

export const updateUsers = async(req, res) =>{

    //mencari user di database
    const user = await Users.findOne({
        where: {
            uuid: req.params.id
        }
    });

    //validasi jika tidak ditemukan
    if (!user) return res.status(404).json({msg:"User tidak ditemukan"});

    const {name, email, password, confPassword, role} = req.body;
    let hashPassword;

    //validasi jika password tidak diupdate atau di upadate
    if(password === ""|| password === null){
        hashPassword = user.password
    }else{
        hashPassword = await argon2.hash(password);
    }

    if(password != confPassword) return res.status(400).json({msg:"Password dan Confirm Password berbeda"})

    //mengupdate user ke database
    try{
        await Users.update({
            name: name,
            email: email,
            password: hashPassword,
            role:role

        },{
            where:{
                id: user.id
            }
        });
        res.status(200).json({msg:"Update User Berhasil"});
    } catch(error){
        res.status(400).json({msg:error.message});
    }

    
}

export const deleteUsers = async(req, res) =>{

    try{
        //mencari user di database
        const user = await Users.findOne({
            where: {
                uuid: req.params.id
            }
        });
    
        //validasi jika tidak ditemukan
        if (!Users) return res.status(404).json({msg:"User tidak ditemukan"});
        
        
        await Users.destroy({
            where:{
                id: user.id
            }
        });
        res.status(204).json({msg:"User dihapus"});
    } catch(error){
        res.status(500).json({msg:error.message});
    }


}