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

/* POST a product to the specified aisle. */
router.post('/aisles/addproduct', bodyParser.json(), function (req, res, next) {
  const aislenumber = req.body.data.aislenumber
  const productid = req.body.data.productid

  const query = 'INSERT INTO AISLECONTAINS VALUES(:aislenumber, :productid);'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        aislenumber: aislenumber,
        productid: productid
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/aisles/' + aislenumber)
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
            connection.query('SELECT * FROM Aisles WHERE :aislenumber = aislenumber;',
                {
                    type: connection.QueryTypes.SELECT,
                    replacements: {
                        aislenumber: aislenumber
                    }
                }).then(aisles => {

                let anumber = aisles[0].aislenumber;
                let aname = aisles[0].aislename;
                let itemToAdd = {
                    'aislenumber': anumber,
                    'aislename': aname
                };
                products.splice(0, 0, itemToAdd)
                console.log(products)
                res.json(products)
            })
        })
})

/* POST updated aisle information. */
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

  /* POST a new aisle. */
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