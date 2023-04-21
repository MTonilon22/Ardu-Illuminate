const db_con = require("../src/database/database");


const userModel = {}

    userModel.addUser = (newUser) => {

        const {id, name, birthdate, email,username,password} = newUser;
        const query = 'INSERT INTO users (user_id, name, birthdate, email, username, password) VALUES (?,?,?,?,?,?)'
        db_con.query(query, [id,name,birthdate,email,username,password], (err, result) => {
            if(err) throw err
            console.log('Succesfully inserted user data');
       })
       
    return id;
    }

    userModel.findById = (id, result) => {
        console.log("The id is", id);
    }



    module.exports = userModel