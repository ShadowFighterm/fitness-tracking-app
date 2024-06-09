const UserServices = require('../services/User');
const jwt = require('jsonwebtoken');

exports.register = async(req, res) =>
    {
        try
        {
            console.log(req.body);
            const
            {
                name,
                email,
                password,
                age,
                gender,
                height,
                weight,
                goal,
                activity,  
            } = req.body;
            const SameUser = await UserServices.GetUserByMail(email);
            if(SameUser)
                {
                    return res.status(400).json({message: 'User already exists'});
                }
            const user = await UserServices.RegisterUser(name,email,password,age,gender,height,weight,goal,activity);
            res.status(200).json({status: "Success", message: "User has been registered succesfully"});
        }
        catch(err)
        {
            console.log(err);
            res.status(500).json({message: "Internal server error"});
        } 
    }
    exports.login = async(req, res) =>
        {
            try
            {
                const {email, password} = req.body;
                const user = await UserServices.GetUserByMail(email);
                if(!user)
                    {
                        return res.status(400).json({message: 'User does not exists'});
                    }
                const PasswordMatch = await UserServices.ComparePassword(email, password);
                if(!PasswordMatch)
                    {
                        return res.status(400).json({message: 'Invalid password'});
                    }
 
                let tokenData={
                    email:user.email,
                    userId:user._id,
                }
                const jwtKey= "A123";
                const token= await UserServices.GenerateTokens(tokenData,jwtKey,"24h");
                res.status(200).json(
                    {
                        status: "success",
                        message: "User logged in successfully",
                        token: token,
                        name: user.name,
                        gender: user.gender,
                        age: user.age,
                        height: user.height,
                        weight: user.weight,
                        activity: user.activity,
                        goal: user.goal,
                        email: user.email,
                    }
                );
                console.log('Loged in');
            }
            catch(err)
            {
                console.log(err); 
                res.status(500).json({message: "Internal server error"});
            }

        }
        exports.updateUserInfo = async (req, res) =>
            {
                try
                {
                    const { email, name, height, weight, age, goal } = req.body;
                    const updatedUser = await UserServices.UpdateUserInfo(email, name, height, weight, age, goal);
            
                    res.status(200).json({
                        status: "Success",
                        message: "User information has been updated successfully",
                        name: updatedUser.name,
                        email: updatedUser.email,
                        height: updatedUser.height,
                        weight: updatedUser.weight,
                        age: updatedUser.age,
                        goal: updatedUser.goal,
                        gender: updatedUser.gender,
                        activity: updatedUser.activity                            
                    });
                }
                catch(err)
                {
                    console.log(err);
                    res.status(500).json({ message: "Internal server error" });
                }
            }