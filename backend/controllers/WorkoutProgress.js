const WorkoutProgressServices = require('../services/WorkoutProgress');

exports.addProgress = async (req, res) => {
    try {
        // Extract parameters from the request body
        const { email, date, caloriesBurnt, steps, time, heartRate } = req.body;
        const newProgress = await WorkoutProgressServices.AddProgress(email, date, caloriesBurnt, steps, time, heartRate);
        const index = newProgress.date.indexOf(date);
        res.status(200).json({status: "success", 
            caloriesBurnt: newProgress.caloriesBurnt[index],
            steps: newProgress.steps[index],
            time: newProgress.time[index],
            heartRate: newProgress.heartRate[index],
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({ message: "Internal server error" });
    }
};

exports.getProgressByEmail = async (req, res) => {
    try {
        // Extract parameters from the query string
        const { email, date } = req.body;
        const progress = await WorkoutProgressServices.GetProgressByEmail(email);
        if(!progress)
        {
            res.status(200).json({status: "success",
                caloriesBurnt: 0,
                steps: 0,
                time: 0,
                heartRate: 0,
            })
        }
        else
        {
            console.log('user exist');
            index = progress.date.indexOf(date);
            console.log(index);
            if(index != -1)
            {
                res.status(200).json({status: "success", 
                    caloriesBurnt: progress.caloriesBurnt[index],
                    steps: progress.steps[index],
                    time: progress.time[index],
                    heartRate: progress.heartRate[index],
                });
            }
            else
            {
                res.status(200).json({status: "success",
                    caloriesBurnt: 0,
                    steps: 0,
                    time: 0,
                    heartRate: 0,
                })  
            }
        }
    } catch (err) {
        console.log(err);
        res.status(500).json({ message: "Internal server error" });
    }
};

