'use strict';

const express = require(`express`);
const listsApi = express.Router();
const mysql = require('mysql2');

const connection = mysql.createConnection({
    user : 'root',
    password : 'rtlry',
    host : 'db',
    database : 'todos_exam'
});

listsApi.get(`/`, (req, res) => {
    connection.query('Select * from list',
    function(err, resultat){
        res.json(resultat);
    });
});

listsApi.post(`/`, (req, res) =>  {    
    var tablo = [
        req.body.label,
        req.body.description,
    ]
    connection.query('INSERT INTO list (label,description) VALUES (?,?)', 
    tablo,
    function (err, result) {
        res.json({
            id:result.insertId,
            label:req.body.label,
            description:req.body.description,
        });    
    });
});

listsApi.put('/:id', (req, res) => {
    var tablo = [
        req.body.label,
        req.body.description,
        req.params.id,
    ]
    connection.query('UPDATE list set label = ?, description = ?  where id = ?', 
    tablo,
        function(err, result) {
            res.json({
                id:req.body.id,
                label:req.body.label,
                description:req.body.description,
        }); 
    });
});

module.exports = listsApi;