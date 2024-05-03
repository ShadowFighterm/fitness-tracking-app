const UserServices = require('../services/User');
const jwt = require('jsonwebtoken');

exports.register = async(req, res) =>
    {
        try
        {
            console.log(req.body);
            const
            {
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
            const user = await UserServices.RegisterUser(email,password,age,gender,height,weight,goal,activity);
            res.json({status: "Success", message: "User has been registered succesfully"});
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
                const PasswordMatch = await UserServices.ComparePassword(password);
                if(!PasswordMatch)
                    {
                        return res.status(400).json({message: 'Invalid password'});
                    }
                const token = jwt.sign({id: user._id}, process.env.JWT_SECRET);
                res.json({status: 'Success', token: token});
            }
            catch(err)
            {
                console.log(err);
                res.status(500).json({message: "Internal server error"});
            }

        }