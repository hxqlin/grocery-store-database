import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET product listing. */
router.get('/product', function (req, res, next) {
  const query = 'SELECT * FROM Product;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(product => {
      console.log(product)
      res.json(product)
    })
})

/* GET product by ID. */
router.get('/product/:productid', function (req, res, next) {
  const productid = req.params.productid
  const query = 'SELECT * FROM Product WHERE ProductID = :productid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        productid: productid
      }
    })
    .then(user => {
        console.log(user)
      if (user.length === 1 ) {
        res.json(user[0])
      } else {
        res.status(404).json({})
      }
    })
})

export default router
