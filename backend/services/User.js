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
            return await user.ComparePassword(password);
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
    static async UpdateUserInfo(email, name, height, weight, age, goal)
    {
        try
        {
            const user = await this.GetUserByMail(email);
            if (!user) {
                throw new Error('User not found');
            }

            // Update user details
            user.name = name || user.name;
            user.height = height || user.height;
            user.weight = weight || user.weight;
            user.age = age || user.age;
            user.goal = goal || user.goal;

            return await user.save();
        }
        catch(err)
        {
            console.log(err);
            throw err;
        }
    }
}
module.exports = UserServices;
