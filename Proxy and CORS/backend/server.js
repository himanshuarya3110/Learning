import express from 'express'

const app = express()
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('Server is Running!!')
})

app.get('/jokes', (req, res) => {
    const jokes = [
        {
            "id": 1,
            "title": "Why don’t skeletons fight each other?",
            "content": "They don’t have the guts."
        },
        {
            "id": 2,
            "title": "Lightbulb joke",
            "content": "How many software engineers does it take to change a lightbulb? None, it’s a hardware problem."
        },
        {
            "id": 3,
            "title": "Elevator joke",
            "content": "I would tell you an elevator joke, but it’s an uplifting experience."
        },
        {
            "id": 4,
            "title": "Coffee dilemma",
            "content": "Why did the coffee file a police report? It got mugged!"
        },
        {
            "id": 5,
            "title": "Parallel lines",
            "content": "Parallel lines have so much in common. It’s a shame they’ll never meet."
        },
        {
            "id": 6,
            "title": "Cookie in therapy",
            "content": "Why was the cookie sad? Because it was feeling crummy."
        },
        {
            "id": 7,
            "title": "Math problem",
            "content": "I told my wife she was drawing her eyebrows too high. She seemed surprised."
        },
        {
            "id": 8,
            "title": "Cow joke",
            "content": "Why do cows have hooves instead of feet? Because they lactose."
        },
        {
            "id": 9,
            "title": "Time flies",
            "content": "I told the time it was flying. It said, 'No, I’m just on a plane.'"
        },
        {
            "id": 10,
            "title": "Potato pun",
            "content": "What do you call a lazy spud? A couch potato."
        },
        {
            "id": 11,
            "title": "Baking humor",
            "content": "Why was the bread so mad? It was going to get toasted."
        },
        {
            "id": 12,
            "title": "Airplane food",
            "content": "Why don’t planes serve good food? Because it’s plain food."
        },
        {
            "id": 13,
            "title": "Guitar joke",
            "content": "How do you make a bandstand? Take away their chairs."
        },
        {
            "id": 14,
            "title": "Beach humor",
            "content": "What do you call a beach that makes you happy? Sand-tastic!"
        },
        {
            "id": 15,
            "title": "Bicycle joke",
            "content": "Why couldn’t the bicycle stand up by itself? It was two-tired."
        },
        {
            "id": 16,
            "title": "Printer jam",
            "content": "Why did the printer break up with the computer? There was no connection."
        },
        {
            "id": 17,
            "title": "Noisy chicken",
            "content": "What do you call a noisy chicken? A hen-thusiast."
        },
        {
            "id": 18,
            "title": "Physics joke",
            "content": "I’m reading a book on anti-gravity. It’s impossible to put down."
        },
        {
            "id": 19,
            "title": "Candle joke",
            "content": "What did one candle say to the other? I’m going out tonight."
        },
        {
            "id": 20,
            "title": "Lazy cat",
            "content": "Why was the cat sitting on the computer? To keep an eye on the mouse."
        }
    ];

    res.send(jokes);
})

app.listen(port, () => {
    console.log(`Server at http://localhost:${port}`)
})