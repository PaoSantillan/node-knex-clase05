require('dotenv').config();
const bodyParser = require('body-parser');
const express = require('express');
const app = express();

//Only test connection db
//const knex = require ("knex");

//Set environment variables
const PORT = process.env.PORT;
const NODE_ENV = process.env.NODE_ENV;


//Middleware
app.use(bodyParser.json({}));
app.use(bodyParser.urlencoded({}))

//Routes
app.use('/api', require('./routes/record'));

//ONLY TEST
/*const instance = knex({
    client: 'mysql',
    connection: {
      database: 'base_laravel',
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: 'admin'
    },
    pool: {
      min: 3,
      max: 7
    },
    migrations: {
      tableName: 'mig'
    },
      acquireConnectionTimeout: 5000
});

instance.raw('select name from users').catch(err => {
    console.log(err);
    process.exit(1);
});*/

app.listen(PORT, () => console.log(`Started at port ${PORT} in ${NODE_ENV} environment`));