const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: 'Jeremy123',
    database: 'ardudb',
    debug: false,
    port: 3306,

});

mysqlConnection.connect(function (error){

    if(error){
       throw error
       return;
    }else{
        console.log('Database is connected');
    }
});

module.exports = mysqlConnection