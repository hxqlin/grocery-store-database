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

router.post('/customers/updateinfo', bodyParser.json(), function (req, res, next) {
    const customerid = req.body.data.customerid
    const customername = req.body.data.customername
    const customerphone = req.body.data.customerphone
    const customeremail = req.body.data.customeremail
  
    const query = 'UPDATE Customers SET customername = :customername, customerphone = :customerphone, customeremail = :customeremail WHERE customerid = :customerid ;'
    connection.query(query,
      {
        type: connection.QueryTypes.UPDATE,
        replacements: {
          customername: customername,
          customerphone: customerphone,
          customerid: customerid,
          customeremail: customeremail
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/customers')
      })
  })

  router.post('/customers/add', bodyParser.json(), function (req, res, next) {
    const customername = req.body.data.customername
    const customerphone = req.body.data.customerphone
    const customeremail = req.body.data.customeremail
  
    const query = 'INSERT INTO customers (customername, customerphone, customeremail) VALUES (:customername, :customerphone, :customeremail) ;'
    connection.query(query,
      {
        type: connection.QueryTypes.INSERT,
        replacements: {
          customername: customername,
          customerphone: customerphone,
          customeremail: customeremail
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/customers')
      })
  })

export default router