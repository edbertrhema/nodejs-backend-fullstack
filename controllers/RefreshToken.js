import Users from "../models/UserModel.js";

import jwt from "jsonwebtoken"

export const RefreshToken = async(req,res) =>{
    try {
        // mengambil cookie refreshtoken
        const refreshToken = req.cookies.refreshToken
        if(!refreshToken) return res.sendStatus(401)
        const user = await Users.findOne({
            where:{
                refresh_token: refreshToken
            }
        });
        if(!user) return res.sendStatus(403);

        jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) =>{
            if(err) return res.sendStatus(403)
            const id = user.id
            const email = user.email
            const role = user.role            
            const accessToken = jwt.sign({email, id, role},process.env.ACCESS_TOKEN_SECRET,{
                expiresIn:'1h'})
            // const accessToken = jwt.sign({email,id,role}, process.env.ACCESS_TOKEN_SECRET,{
            //     expiresIn:'10s'
            // }) 
            res.json({accessToken})
        })
    } catch (error) {
        console.log(error)
    }
}