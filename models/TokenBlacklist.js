import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const {DataTypes} = Sequelize;

const TokenBlacklist = db.define('token_bl',{
    
    name:{
        type:DataTypes.TEXT
    },    
},{
    freezeTableName: true
});

export default TokenBlacklist