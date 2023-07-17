const express = require('express');
const fs = require('fs');
const app = express();
const port = 5000;

app.get('/', (req, res) => {
    fs.readFile('/flag', 'utf8', (err, data) => {
        if (err) {
            console.error(err);
            return res.status(500).send('An error occurred while reading the flag.');
        }
        res.send(data);
    });
});

app.listen(port, () => {
    console.log(`App running on http://localhost:${port}`);
});
