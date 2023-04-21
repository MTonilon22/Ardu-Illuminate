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
        console.error('error connecting: ' + err.stack);
        return;
    }else{
        console.log('Database is connected');
    }
});

module.exports = mysqlConnection