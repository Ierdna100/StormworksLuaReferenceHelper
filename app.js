var express = require('express')
var bodyParser = require('body-parser')
const fs = require('fs')

var app = express()
app.use(bodyParser.urlencoded({ extended: true }))

let partials = 0
let output = ""
app.get('/send', (req, res) => {
    console.log(req.query)
    console.log(output)
    const data = JSON.parse(req.query.d)
    output += data.data
    const partials2 = data.partial.split("/")
    if (partials2[0] == partials2[1]) {
        fs.writeFileSync("./output.json", JSON.stringify(JSON.parse(output), null, "\t"), null, "\t")
        output = ""
    }
    res.status(200).send();
})

app.listen(3000, () => {
    console.log(`Example app listening on port ${3000}`)
})

/*
d={"partial":"1/1","_function":"someFuncName"}
%7B {
%22 "
%3A :
%2F /
%2C ,
%7D }
%5B [
%5D ]
*/