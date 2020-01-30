require("dotenv").config();

const express = require('express');
const bodyParser = require('body-parser');


const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded( { extended: false} ));
require('./controllers/authController')(app);
require('./controllers/projectController')(app);
require('./controllers/propertieController')(app); 
require('./controllers/cityController')(app); 
require('./controllers/bookingController')(app); 
app.listen(3333); 