require("dotenv").config();

const express = require('express');
const bodyParser = require('body-parser');


const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded( { extended: false} ));
<<<<<<< HEAD
require('./controllers/index')(app);

=======
require('./controllers/authController')(app);
require('./controllers/projectController')(app);
require('./controllers/propertieController')(app); 
require('./controllers/cityController')(app); 
require('./controllers/paymentController')(app); 
>>>>>>> f35c5ef98d47d2081d523dff6d3bfc5f207f481b
app.listen(3333); 