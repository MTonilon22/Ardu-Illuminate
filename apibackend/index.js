const express = require('express');
const app = express();

const userPost = require('./post/user')
//settings
app.set('port', process.env.PORT || 8000);

//Middlewares
app.use(express.json());

//Routes

app.use("/",userPost)

app.get('/', (req,res) => {
    res.send({"message": "welcome", })
})

//Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});



