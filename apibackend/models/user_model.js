const db_con = require("../src/database/database");


const userModel = function(user){

    this.name = user.name;
    this.birthdate = user.birthdate;
    this.email = user.email;
    this.username = user.username;
    this.password = user.password;
};


userModel.addUser = (newUser, result) => {
    db_con.query("INSERT INTO users SET ?", newUser, (err,res) => {
            if(err){
                console.log("error: ", err);
                result(err,null);
                return;
            }
        console.log("Created User: ", {user_id: res.insertId, ...newUser});
        console.log("added new user")
       
    });
}


    // userModel.addUser = (newUser) => {

    //     const {id, name, birthdate, email,username,password} = newUser;
    //     const query = 'INSERT INTO users (user_id, name, birthdate, email, username, password) VALUES (?,?,?,?,?,?)'
    //     db_con.query(query, [id,name,birthdate,email,username,password], (err, result) => {
    //         if(err) throw err
    //         console.log('Succesfully inserted user data');
    //    })
       
    // return id;
    // }




    module.exports = userModel