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
    .then(product => {
        console.log(product)
      if (product.length === 1 ) {
        res.json(product[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.post('/product/add', bodyParser.json(), function (req, res, next) {
  const productid = req.body.data.productid
  const productname = req.body.data.productname
  const departmentname = req.body.data.departmentname
  const pricepercostunit = req.body.data.pricepercostunit
  const costunit = req.body.data.costunit

  const query = 'INSERT INTO Product (productid, productname, departmentname, pricepercostunit, costunit) VALUES (:productid, :productname, :departmentname, :pricepercostunit, :costunit) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        productid: productid,
        productname: productname,
        departmentname: departmentname,
        pricepercostunit: pricepercostunit,
        costunit: costunit
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/product')
    })
})

router.post('/product/updatecost', bodyParser.json(), function (req, res, next) {
  const productid = req.body.data.productid
  const pricepercostunit = req.body.data.pricepercostunit
  const costunit = req.body.data.costunit

  const query = 'UPDATE Product SET pricepercostunit = :pricepercostunit, costunit = :costunit WHERE productid = :productid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        pricepercostunit: pricepercostunit,
        costunit: costunit,
        productid: productid
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/product')
    })
})

export default router
