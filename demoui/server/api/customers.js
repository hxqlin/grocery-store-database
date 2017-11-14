import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET customers listing. */
router.get('/customers', function (req, res, next) {
  const query = 'SELECT * FROM Customers ORDER BY customerid ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(customers => {
      console.log(customers)
      res.json(customers)
    })
})

/* GET customer by ID. */
router.get('/customers/:customerid', function (req, res, next) {
  const customerid = req.params.customerid
  const query = 'SELECT * FROM Customers WHERE customerid = :customerid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        customerid: customerid
      }
    })
    .then(customer => {
      if (customer.length === 1 ) {
        res.json(customer[0])
      } else {
        res.status(404).json({})
      }
    })
})

export default router