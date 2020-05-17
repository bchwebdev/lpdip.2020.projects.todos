'use strict';

const express = require(`express`);
const todoApi = express.Router();
const mysql = require('mysql2');

const connection = mysql.createConnection({
    user : 'root',
    password : 'rtlry',
    host : 'db',
    database : 'todos_exam'
});

todoApi.get(`/`, (req, res) => {
    connection.query('Select * from todo',
    function(err, resultat){
        resultat.forEach(element => {
            if (element.isDone = 0) {
                element.isDone = false
            }
            else {
                element.isDone = true
            }
        });
        res.json(resultat);
    });
});

todoApi.post(`/`, (req, res) =>  {    
    var tablo = [
        req.body.label,
        req.body.idList,
        false,
    ]
    connection.query('INSERT INTO todo (label,idList,isDone) VALUES (?,?,?)', 
    tablo,
    function (err, result) {
        res.json({
            id:result.insertId,
            label:req.body.label,
            idList:req.body.idList,
            isDone:false,
        });    
    });
});

todoApi.put('/:id', (req, res) => {
    var tablo = [
        req.body.label,
        req.body.isDone,
        req.params.id,
    ]
    connection.query('UPDATE todo set label = ?, isDone = ? where id = ?', 
    tablo,
        function(err, result) {
            res.json({
                id:req.body.id,
                label:req.body.label,
                idList:req.body.idList,
                isDone:req.body.isDone,
        }); 
    });
});

todoApi.delete('/:id', (req, res) => {
    connection.query('DELETE FROM todo where id = ?', [req.params.id],
    function(err, result) {
        res.json(result);
    });
});

module.exports = todoApi;