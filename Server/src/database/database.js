const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({

    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'Jeremy123',
    databases: 'ardudb',
    debug: false,
    port: 3306, 

});

const db = mysql.createPool(mysqlConnection);
mysqlConnection.connect(function (error){

    if(error){
       console.log(error)
       return;
    }else{
        console.log('Database is connected');
    }
});

module.exports =  {
    db,
};