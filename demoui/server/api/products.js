import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET product listing. */
router.get('/products', function (req, res, next) {
  const query = 'SELECT * FROM Products ORDER BY productid ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(product => {
      console.log(product)
      res.json(product)
    })
})

/* GET low stock product listing. */
router.get('/products/lowstock', function (req, res, next) {
  const query = 'SELECT * FROM LowStock ORDER BY ProductID ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
  .then(product => {
    console.log(product)
    res.json(product)
  })
})

/* GET product by ID. */
router.get('/products/:productid', function (req, res, next) {
  const productid = req.params.productid
  const query = 'SELECT * FROM Products WHERE ProductID = :productid;'
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

/* POST a new product. */
router.post('/products/add', bodyParser.json(), function (req, res, next) {
  const productid = req.body.data.productid
  const productname = req.body.data.productname
  const departmentname = req.body.data.departmentname
  const pricepercostunit = req.body.data.pricepercostunit
  const costunit = req.body.data.costunit
  const brand = req.body.data.brand
  const quantityinstock = req.body.data.quantityinstock
  const productiondate = req.body.data.productiondate
  const bestbeforedate = req.body.data.bestbeforedate
  const PLU = req.body.data.PLU
  const UPC = req.body.data.UPC
  const organic = req.body.data.organic
  const cut = req.body.data.cut
  const animal = req.body.data.animal

  const query = 'INSERT INTO Products (productname, departmentname, pricepercostunit, costunit, brand, quantityinstock, productiondate, bestbeforedate, plu, upc, organic, cut, animal) VALUES (:productname, :departmentname, :pricepercostunit, :costunit, :brand, :quantityinstock, :productiondate, :bestbeforedate, :PLU, :UPC, :organic, :cut, :animal) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        productid: productid,
        productname: productname,
        departmentname: departmentname,
        pricepercostunit: pricepercostunit,
        costunit: costunit,
        brand: brand,
        quantityinstock: quantityinstock,
        productiondate: productiondate,
        bestbeforedate: bestbeforedate,
        PLU: PLU,
        UPC: UPC,
        organic: organic,
        cut: cut,
        animal: animal
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/products')
    })
})

/* POST an updated cost for a product. */
router.post('/products/updatecost', bodyParser.json(), function (req, res, next) {
  const productid = req.body.data.productid
  const pricepercostunit = req.body.data.pricepercostunit
  const costunit = req.body.data.costunit

  const query = 'UPDATE Products SET pricepercostunit = :pricepercostunit, costunit = :costunit WHERE productid = :productid ;'
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
      res.send('/products')
    })
})

/* POST an updated quantity for a product. */
router.post('/products/updatequantity', bodyParser.json(), function (req, res, next) {
  const productid = req.body.data.productid
  const quantityinstock = req.body.data.quantityinstock

  const query = 'UPDATE Products SET quantityinstock = :quantityinstock WHERE productid = :productid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        quantityinstock: quantityinstock,
        productid: productid
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/products')
    })
})

export default router
