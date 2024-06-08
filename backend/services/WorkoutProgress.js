const WorkoutProgress = require('../models/WorkoutProgress');
const { GetUserByMail } = require('./User');

class WorkoutProgressServices {
    static async AddProgress(email, date, caloriesBurnt, steps, time, heartRate) {
        try {
            let existingProgress = await this.GetProgressByEmail(email);

            if (existingProgress)
            {
                const index = existingProgress.date.indexOf(date);
                console.log(index);
                if(index != -1)
                {
                    existingProgress.date[index] = date;
                    existingProgress.caloriesBurnt[index] = caloriesBurnt;
                    existingProgress.steps[index] = steps;
                    existingProgress.time[index] = time;
                    existingProgress.heartRate[index] = heartRate;
                }
                else
                {
                    existingProgress.date.push(date);
                    existingProgress.caloriesBurnt.push(caloriesBurnt);
                    existingProgress.steps.push(steps);
                    existingProgress.time.push(time);
                    existingProgress.heartRate.push(heartRate);
                }
                
                return await existingProgress.save();
            } else {
                const newProgress = new WorkoutProgress({
                    email,
                    date,
                    caloriesBurnt,
                    steps,
                    time,
                    heartRate
                });
                return await newProgress.save();
            }
        } catch (err) {
            console.log(err);
            throw err;
        }
    }

    static async GetProgressByEmail(email)
    {
        try 
        {
            console.log('email', email);
            return await WorkoutProgress.findOne({ email });
        } 
        catch (err) 
        {
            console.log('Error in get progress by email service', err);
            throw err;
        }
    }
}

module.exports = WorkoutProgressServices;
