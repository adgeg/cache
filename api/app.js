const express = require('express')
const app = express()
const port = 3000


app.get('/tasks', (req, res) => {
  res.json([
    { id: '1', content: 'Discover cache', status:'TO_DO'},
    { id: '2', content: 'Watching this video', status:'DOING'},
    { id: '3', content: 'Add to my Flutter app', status:'DONE'}
  ])
})


/*
app.get('/tasks', function (req, res, next) {
  res.header('Cache-control', `max-age=10`)
  next();
}, function (req, res, next) {
  res.json([
    { id: '1', content: 'Discover cache', status:'TO_DO'},
    { id: '2', content: 'Watching this video', status:'DOING'},
    { id: '3', content: 'Add to my Flutter app', status:'DONE'},
    { id: '4', content: 'Et voilà!', status:'TO_DO'}
  ])
})*/


app.listen(port, () => { console.log(`Simple tasks API with node.js and Express`) })