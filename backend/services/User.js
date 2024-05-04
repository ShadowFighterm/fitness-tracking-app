const UserMod = require('../models/User');
const jwt = require('jsonwebtoken');

class UserServices
{
    static async RegisterUser(email,password,age,gender,height,weight,goal,activity)
    {
        try
        {
            console.log("email",email,"password",password,"age",age,"gender",gender,"height",height,"weight",weight,
            "goal",goal,"activity",activity);
            const CreateUser = new UserMod(email,password,age,gender,height,weight,goal,activity);
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
            return await UserMod.FindOne({email: email});
        }
        catch(err)
        {
            console.log(err);
        }
    }
    static async CheckUser(email)
    {
        try
        {
            return await UserMod.FindOne({email: email});
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
module.exports = UserServices;
