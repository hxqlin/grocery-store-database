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

export default router
