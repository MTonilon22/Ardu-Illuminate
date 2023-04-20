const { Router } = require('express');
const router = Router();

const mysqlConnection = require('../database/database');

router.get('/', (req,res) =>{
    res.status(200).json("Server on port 8000 and database is connected");

});

router.get('/:user', (res,req) => {
    mysqlConnection.query('select * from user;', (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }else{
            console.log(error);
        }
    })
})

router.get('/user/:id', (req,res) => {
    const {user_id} = req.params;
    mysqlConnection.query('select * from users where user_id = ?;', [user_id], (error, rows, fields) =>{
        if(!error){
            res.json(rows);
        }else{
            console.log(error);
        }
    })
})

router.post('/user', (req,res) => {
    const {user_id, name, birthdate, email, username, password} = req.body;
    console.log(req.body);
    mysqlConnection.query('insert into users(user_id,name,birthdate,email,username,password) values(?,?,?,?,?,?);',
    [user_id,name,birthdate,email,username,password], (error,rows,fields) => {
        if(!error){
            res.json({Status: 'User saved'});
        }else{
            console.log(error);
        }
    } )
});

router.put('/user/:id', (req,res) => {
    const {user_id, name, birthdate, email, username, password} = req.body;
    console.log(req.body); 
    mysqlConnection.query ('update user set name = ?, birthdate =?, email = ?, username = ?, password = ? where id = ? ;',
    [name,birthdate,email,username,password,randomstr,hash, user_id], (error,rows,fields) => {
        if(!error){
            res.json({Status: 'User updated'});
        }else{
            console.log(error);
        }
    })
});

router.delete('/user/id', (req, res) => {
    const {user_id} = req.params;
    mysqlConnection.query('delete from user where user_id = ?:', {user_id}, (error, rows, fields) => {
        if(!error){
            res.json({Status: 'User deleted'});
        }else{
            res.json({Status: error})
        }
    });
});

module.exports = router;
