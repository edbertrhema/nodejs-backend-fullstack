import Users from "../models/UserModel.js";
import TokenBlacklist from "../models/TokenBlacklist.js";
import jwt from "jsonwebtoken"



export const verifyUser = async(req, res, next)=>{


    
    // console.log({token})
    try {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1]
        //cek token yg terblacklist di db
        const bl_token = await TokenBlacklist.findOne({
            where: {
                name: token
            }
        })        

        if(token == null || bl_token!= null) return res.sendStatus(401)
    
    
        jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, decoded) =>{
            if(err) return res.sendStatus(403)
            req.uuid = decoded.uuid
            req.name = decoded.name
            req.email = decoded.email
            req.userId = decoded.id;
            req.role = decoded.role;    
            next()
        })
    } catch (error) {
        res.status(500).json({msg:error.message}) 
    }



    // // mengecek session dari akun yang login
    // if(!req.session.userId){
    //     return res.status(401).json({msg:"Mohon login ke akun anda!"})
    // }

    // //mencari user di database
    // const user = await Users.findOne({
    //     where: {
    //         uuid: req.session.userId
    //     }
    // });        
    // //validasi jika tidak ditemukan
    // if (!Users) return res.status(404).json({msg:"User tidak ditemukan"});
    
    // req.userId = user.id;
    // req.role = user.role;
    // next();

}

export const adminOnly = async(req, res, next)=>{

    try {
        
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1]
        //cek token yg terblacklist di db
        const bl_token = await TokenBlacklist.findOne({
            where: {
                name: token
            }
        })        

        if(token == null || bl_token!= null) return res.sendStatus(401)
    
    
        jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, decoded) =>{
            if(err) return res.sendStatus(403)
            req.uuid = decoded.uuid
            req.name = decoded.name
            req.email = decoded.email
            req.userId = decoded.id;
            req.role = decoded.role;    
            console.log(req.role)
            if (req.role !== "admin") return res.status(403).json({msg:"Akses terlarang"});
            next()
            
        })        
        //mencari user di database
        // const user = await Users.findOne({
        //     where: {
        //         uuid: req.params.id
        //     }
        // });
        
        // //validasi jika tidak ditemukan
        // if (!Users) return res.status(404).json({msg:"User tidak ditemukan"});
        
        //validasi jika role bukan admin  
        // next();        
    } catch (error) {
        res.status(500).json({msg:error.message})        
    }
}