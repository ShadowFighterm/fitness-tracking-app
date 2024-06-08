const UserMod = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

class UserServices
{
    static async RegisterUser(name,email,password,age,gender,height,weight,goal,activity)
    {
        try
        {
            console.log("name",name,"email",email,"password",password,"age",age,"gender",gender,"height",height,"weight",weight,
            "goal",goal,"activity",activity);
            const CreateUser = new UserMod({name,email,password,age,gender,height,weight,goal,activity});
            return await CreateUser.save();
        }
        catch(err)
        {
            console.log(err);
        }
    }
    //write code for sum

    
    static async GetUserByMail(email)
    {
        try
        {
            return await UserMod.findOne({email});
        }
        catch(err)
        {
            console.log(err);
        }
    }
    static async ComparePassword(email, password)
    {
        try
        {
            var user = await this.GetUserByMail(email);
            const match = await bcrypt.compare(password, user.password);
            console.log(match);
            return match
        }
        catch(err)
        {
            console.log("Error in comparing password", err);
            return false;
        } 
    }
    static async CheckUser(email)
    {
        try
        {
            return await UserMod.findOne({email});
        }
        catch(err)
        {
            console.log(err);
        }
    }
    static async GenerateTokens(TokenData,JWTKey,TokenExpiryTime)
    {
        try
        {
            return jwt.sign(TokenData,JWTKey,{expiresIn: TokenExpiryTime});
        }
        catch(err)
        {
            console.log(err);
        }
    }
}
module.exports = UserServices; // connections to exercise page  with backend 
