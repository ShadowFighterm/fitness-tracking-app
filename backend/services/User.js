const UserMod = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

class UserServices
{
    static async RegisterUser(name,email,password,age,gender,height,weight,goal,activity,exerciseRecords)
    {
        try
        {
            console.log("name",name,"email",email,"password",password,"age",age,"gender",gender,"height",height,"weight",weight,
            "goal",goal,"activity",activity,"exercise",exerciseRecords);
            const CreateUser = new UserMod({name,email,password,age,gender,height,weight,goal,activity,exerciseRecords});
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
    // static async UpdateUserInfo(email, name, height, weight, age, goal)
    // {
    //     try
    //     {
    //         const user = await this.GetUserByMail(email);
    //         if (!user) {
    //             throw new Error('User not found');
    //         }

    //         // Update user details
    //         user.name = name || user.name;
    //         user.height = height || user.height;
    //         user.weight = weight || user.weight;
    //         user.age = age || user.age;
    //         user.goal = goal || user.goal;

    //         return await user.save();
    //     }
    //     catch(err)
    //     {
    //         console.log(err);
    //         throw err;
    //     }
    // }




    static async UpdateUserInfo(email, name, height, weight, age, goal,
        running, cycling, swimming, walking, weightlifting, yoga, jumpingRope, aerobics) {
        try {
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

            user.running = running || user.running;
            user.cycling = cycling || user.cycling;
            user.swimming = swimming || user.swimming;
            user.walking = walking || user.walking;
            user.weightlifting = weightlifting || user.weightlifting;
            user.yoga = yoga || user.yoga;
            user.jumpingRope = jumpingRope || user.jumpingRope;
            user.aerobics = aerobics || user.aerobics;


            const today = new Date();
                  today.setHours(0, 0, 0, 0); // Set time to start of the day for comparison
              
                  // Check if there's a workout record for today
                  const dateIndex = user.date.findIndex(
                    (record) => record.getDate() === today.getDate()
                  );
               const Calories =  (user.running + user.cycling + user.swimming + user.walking + user.weightlifting + user.yoga + user.jumpingRope+ user.aerobics)/10;
                  if (dateIndex !== -1) {
                    user.calories[dateIndex] = Calories;
                  } else {
                    // If workout record doesn't exist for today, insert a new record
                    user.date.push(today);
                    user.calories.push(Calories);
                  }



            return await user.save();
        } catch (err) {
            console.log(err);
            throw err;
        }
    }
}

module.exports = UserServices;
