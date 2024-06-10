const UserServices = require('../services/User');
const WorkoutProgressServices = require('../services/WorkoutProgress');
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

        };
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
            };

            exports.getUsersWithName = async (req, res) =>
                {
                    try
                    {
                        const { email, name } = req.body;
                        if (!name)
                        {
                            console.log('What?');
                            return res.status(400).json({ message: "Name is required" });
                        }
                        const currUser = await UserServices.GetUserByMail(email);
                        const users = await UserServices.GetUsersByName(name);
                        var userfriends = currUser.friends;
                        if (users.length == 0)
                        {
                            return res.status(600).json({ message: "No users found with the given name" });
                        }
                        var usersMail = [];
                        var usersName = [];
                        for(var i = 0; i < users.length; i++)
                        {
                            var found = false;
                            for(var j = 0 ; j < userfriends.length; j++)
                            {
                                if(users[i].email == userfriends[j] || users[i].email == email)
                                {
                                    found = true;
                                    break;
                                }
                            }
                            if(!found)
                            {
                                usersMail.push(users[i].email);
                                usersName.push(users[i].name);
                            }
                        }
                        res.status(200).json({
                            status: "success",
                            message: "Users found",
                            usersMail: usersMail,
                            usersName: usersName,
                        });
                    }
                    catch(err)
                    {
                        console.log(err);
                        res.status(500).json({ message: "Internal server error" });
                    }
                };

                exports.getUsersFriends = async (req, res) =>
                    {
                        try
                        {
                            const { email } = req.body;
                            if (!email)
                            {
                                console.log('What?');
                                return res.status(400).json({ message: "Email is required" });
                            }
                    
                            const user = await UserServices.GetUserByMail(email);
                            var friends = user.friends;
                            if (friends.length == 0)
                            {
                                return res.status(600).json({ message: "No friends found" });
                            }
                            var friendsCal = [];
                            var friendsNames = [];
                            var currentDate = new Date();
                            var CDStr = currentDate.toISOString().split('T')[0];
                            console.log(CDStr);
                            for(var i = 0; i < friends.length; i++)
                            {
                                var friend = await UserServices.GetUserByMail(friends[i]);
                                friendsNames.push(friend.name);
                                var friendRecord = await WorkoutProgressServices.GetProgressByEmail(friends[i]);
                                var index = -1;
                                if(friendRecord)
                                {
                                    index = friendRecord.date.indexOf(CDStr);
                                }
                                var friendCal =  ((index == -1)?0:friendRecord.caloriesBurnt[index]);
                                friendsCal.push(friendCal);
                            }
                            res.status(200).json({
                                status: "success",
                                message: "Users found",
                                friendsNames: friendsNames,
                                friendsMails: friends,
                                friendsCal: friendsCal
                            });
                        }
                        catch(err)
                        {
                            console.log(err);
                            res.status(500).json({ message: "Internal server error" });
                        }
                    };

                    exports.addFriend = async (req, res) => 
                        {
                            try
                            {
                                const { email, friendMail } = req.body;
                                var updatedUser = await UserServices.AddFriend(email, friendMail);
                                await UserServices.SendNotificationToFriend(email,friendMail);
                                var friends = updatedUser.friends;
                                var friendsNames = [];
                                var friendsCal = [];
                                var currentDate = new Date();
                                var CDStr = currentDate.toISOString().split('T')[0];
                                console.log(CDStr);
                                for(var i = 0 ; i < friends.length; i++)
                                {
                                    var friend = await UserServices.GetUserByMail(friends[i]);
                                    friendsNames.push(friend.name);
                                    var friendRecord = await WorkoutProgressServices.GetProgressByEmail(friends[i]);
                                    var index = -1;
                                    if(friendRecord)
                                    {
                                        index = friendRecord.date.indexOf(CDStr);
                                    }
                                    var friendCal =  ((index == -1)?0:friendRecord.caloriesBurnt[index]);
                                    friendsCal.push(friendCal);
                                }
                                res.status(200).json({
                                    status: "success",
                                    friendsNames: friendsNames,
                                    friendsMails: friends,
                                    friendsCal: friendsCal
                                });
                            }
                            catch(err)
                            {
                                console.log(err);
                                res.status(500).json({ message: "Internal server error" });
                            }
                        };
exports.removeFriend = async(req, res) =>                        
    {
        try
        {
            const { email, friendMail } = req.body;
            var updatedUser = await UserServices.RemoveFriend(email, friendMail);
            var friends = updatedUser.friends;
            var friendsNames = [];
            var friendsCal = [];
            var currentDate = new Date();
            var CDStr = currentDate.toISOString().split('T')[0];
            console.log(CDStr);
            for(var i = 0 ; i < friends.length; i++)
            {
                var friend = await UserServices.GetUserByMail(friends[i]);
                friendsNames.push(friend.name);
                var friendRecord = await WorkoutProgressServices.GetProgressByEmail(friends[i]);
                var index = -1;
                if(friendRecord)
                {
                    index = friendRecord.date.indexOf(CDStr);
                }
                var friendCal =  ((index == -1)?0:friendRecord.caloriesBurnt[index]);
                friendsCal.push(friendCal);
            }
            res.status(200).json({
                status: "success",
                friendsNames: friendsNames,
                friendsMails: friends,
                friendsCal: friendsCal
            });

        }
        catch(err)
        {
            console.log(err);
            res.status(500).json({ message: "Internal server error" });
        }
    }

exports.getNotifications = async(req, res) => 
{
    try
    {
        const { email } = req.body;
        const user = await UserServices.GetUserByMail(email);
        if(user)
        {
            console.log('Got notifications');
            res.status(200).json({
                status: "success",
                notifications: user.notifications, 
            });
        }
        else 
        {
            res.status(400).json({
                message: "Server error or user does not exists",
            });
        }
    }
    catch(err)
    {
        console.log(err);
        res.status(500).json({ message: "Internal server error" });
    }
}