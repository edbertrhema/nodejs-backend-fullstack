import Users from "../models/UserModel.js";
import TokenBlacklist from "../models/TokenBlacklist.js";
import argon2 from "argon2";
import jwt from "jsonwebtoken"

export const Login = async(req, res) =>{

    try {
        //mencari user di database
        const user = await Users.findOne({
            where: {
                email: req.body.email
            }
        });
    
        if(!req.body.email || !req.body.password) return res.status(400).json({msg:"Silahkan isi Email dan Password"})

        //validasi jika tidak ditemukan
        if (!user) return res.status(404).json({msg:"User tidak ditemukan"});
        
        //menverifikasi login
        const match = await argon2.verify(user.password, req.body.password);
        if(!match) return res.status(400).json({msg:"Email atau Password Salah"});
    
        // req.session.userId = user.uuid;
        const id = user.id
        const uuid = user.uuid;
        const name = user.name;
        const email = user.email;
        const role = user.role;    
        const accessToken = jwt.sign({uuid,name,email,id,role}, process.env.ACCESS_TOKEN_SECRET,{
            expiresIn:'1d'
        })    
        const refreshToken = jwt.sign({uuid,name,email,id,role}, process.env.REFRESH_TOKEN_SECRET,{
            expiresIn:'1d'
        })    

                
        await Users.update({refresh_token: refreshToken},{
            where:{
                id:user.id
            }
        })

        res.cookie('refreshToken',refreshToken,{
            httpOnly: true,
            maxAge: 24 * 60 * 60 * 1000, //dalam milisecond
            //secure: true  //jika url https
        })

        res.status(200).json({accessToken})
        
    } catch (error) {
        res.status(500).json({msg:error.message})        
    }
}

export const Me = async (req, res) => {
    // mengecek session dari akun yang login
    // if(!req.session.userId){
    //     return res.status(401).json({msg:"Mohon login ke akun anda!"})
    // }

    //mencari user di database
    const user = await Users.findOne({
        attributes:['uuid','name','email','role'],
        where: {
            uuid: req.uuid
        }
    });

    //validasi jika tidak ditemukan
    if (!Users) return res.status(404).json({msg:"User tidak ditemukan"});
    
    res.status(200).json(user);
}

export const logOut = async(req, res) =>{

    // try {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1]
        console.log({token})
        await TokenBlacklist.create({name: token})        
    // } catch (error) {
    //     res.status(403).json({msg:"anda sudah logout"})        
    // }


    const refreshToken = req.cookies.refreshToken
    if(!refreshToken) return res.sendStatus(204)
    const user = await Users.findOne({
        where:{
            refresh_token: refreshToken
        }
    });
    if(!user) return res.sendStatus(204);    
    
    const id = user.id

    await Users.update({refresh_token: null},{
        where:{
            id:id
        }
    })


    res.clearCookie('refreshToken')
    return res.sendStatus(200)
    // req.session.destroy((err)=>{
    //     if(err) return res.status(400).json({msg:"Tidak dapat Logout"});
    //     res.status(200).json({msg:"Anda telah logout"});
    // });


}