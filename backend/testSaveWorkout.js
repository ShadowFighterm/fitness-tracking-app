// Import the fetch function from node-fetch
const fetch = require('node-fetch');

// Define the URL of your endpoint
const url = 'http://192.168.43.106:3000/saveWorkout';

// Define the data to be sent in the POST request
const workoutData = {
    email: 'user@example.com',
    running: 30,
    cycling: 20,
    swimming: 15,
    walking: 10,
    weightlifting: 25,
    yoga: 5,
    jumpingRope: 10,
    aerobics: 20
};

// Define an async function to make the POST request
const testSaveWorkout = async () => {
    try {
        // Make the POST request using fetch
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(workoutData)
        });

        // Check if the response is successful
        if (response.ok) {
            // Parse the JSON response
            const data = await response.json();
            console.log('Response:', data);
        } else {
            // Log the error status and text if the request was not successful
            console.log('Error:', response.status, response.statusText);
            const errorData = await response.json();
            console.log('Error Data:', errorData);
        }
    } catch (error) {
        // Log any errors that occurred during the fetch
        console.error('Fetch error:', error);
    }
};

// Call the test function
testSaveWorkout();
