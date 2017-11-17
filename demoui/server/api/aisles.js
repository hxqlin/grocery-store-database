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

/* GET products by AisleNumber. */
router.get('/aisles/:aislenumber', function (req, res, next) {
    const aislenumber = req.params.aislenumber
    const query = 'SELECT DISTINCT P.ProductID, P.ProductName, P.QuantityInStock, AC.AisleNumber, A.AisleName FROM AisleContains AC, Products P, Aisles A WHERE :aislenumber = A.AisleNumber AND A.AisleNumber = AC.AisleNumber AND P.ProductID = AC.ProductID ORDER BY P.ProductID ASC;'
    connection.query(query,
        {
            type: connection.QueryTypes.SELECT,
            replacements: {
                aislenumber: aislenumber
            }
        })
        .then(products => {
            console.log("Here are the products")
            console.log(products)
            if(products.length === 0)
                res.status(404).json({})
            else
                res.json(products)
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