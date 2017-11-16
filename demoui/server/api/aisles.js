import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET aisles listing. */
router.get('/aisles', function (req, res, next) {
  const query = 'SELECT * FROM Aisles ORDER BY aislenumber ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(aisles => {
      console.log(aisles)
      res.json(aisles)
    })
})

/* GET aisle by ID. */
router.get('/aisles/:aislenumber', function (req, res, next) {
  const aislenumber = req.params.aislenumber
  const query = 'SELECT * FROM Aisles WHERE aislenumber = :aislenumber ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        aislenumber: aislenumber
      }
    })
    .then(aisle => {
      if (aisle.length === 1 ) {
        res.json(aisle[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.post('/aisles/updateinfo', bodyParser.json(), function (req, res, next) {
    const aislenumber = req.body.data.aislenumber
    const aislename = req.body.data.aislename
  
    const query = 'UPDATE Aisles SET aislename = :aislename WHERE aislenumber = :aislenumber ;'
    connection.query(query,
      {
        type: connection.QueryTypes.UPDATE,
        replacements: {
          aislename: aislename,
          aislenumber: aislenumber
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/aisles')
      })
  })

  router.post('/aisles/add', bodyParser.json(), function (req, res, next) {
    const aislename = req.body.data.aislename
    const aislenumber = req.body.data.aislenumber
  
    const query = 'INSERT INTO Aisles (aislenumber, aislename) VALUES (:aislenumber, :aislename) ;'
    connection.query(query,
      {
        type: connection.QueryTypes.INSERT,
        replacements: {
          aislename: aislename,
          aislenumber: aislenumber
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/aisles')
      })
  })

export default router