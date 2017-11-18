import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET suppliers listing. */
router.get('/suppliers', function (req, res, next) {
  const query = 'SELECT * FROM Suppliers ORDER BY supplierid ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(suppliers => {
      console.log(suppliers)
      res.json(suppliers)
    })
})

/* GET products by supplierID. */
router.get('/suppliers/:supplierid', function (req, res, next) {
    const supplierid = req.params.supplierid
    const query = 'SELECT DISTINCT P.ProductID, P.ProductName, P.QuantityInStock FROM ProvidedBy PB, Products P WHERE :supplierid = PB.supplierid AND PB.productID = P.productID ORDER BY P.ProductID ASC;'
    connection.query(query,
        {
            type: connection.QueryTypes.SELECT,
            replacements: {
                supplierid: supplierid
            }
        })
        .then(products => {
            connection.query('SELECT * FROM Suppliers WHERE :supplierid = supplierid;',
                {
                    type: connection.QueryTypes.SELECT,
                    replacements: {
                        supplierid: supplierid
                    }
                }).then(supplier => {

                let sid = supplier[0].supplierid;
                let sname = supplier[0].suppliername;
                let sphone = supplier[0].supplierphone;
                let saddress = supplier[0].supplieraddress;
                let itemToAdd = {
                    'supplierid': sid,
                    'suppliername': sname,
                    'supplierphone': sphone,
                    'supplieraddress': saddress
                };
                products.splice(0, 0, itemToAdd)
                console.log(products)
                res.json(products)
            })
        })
})

router.post('/suppliers/updateinfo', bodyParser.json(), function (req, res, next) {
    const supplierid = req.body.data.supplierid
    const suppliername = req.body.data.suppliername
    const supplierphone = req.body.data.supplierphone
    const supplieraddress = req.body.data.supplieraddress
  
    const query = 'UPDATE Suppliers SET suppliername = :suppliername, supplierphone = :supplierphone, supplieraddress = :supplieraddress WHERE supplierid = :supplierid;'
    connection.query(query,
      {
        type: connection.QueryTypes.UPDATE,
        replacements: {
          suppliername: suppliername,
          supplierphone: supplierphone,
          supplierid: supplierid,
          supplieraddress: supplieraddress
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/suppliers')
      })
  })

  router.post('/suppliers/add', bodyParser.json(), function (req, res, next) {
    const suppliername = req.body.data.suppliername
    const supplierphone = req.body.data.supplierphone
    const supplieraddress = req.body.data.supplieraddress
  
    const query = 'INSERT INTO Suppliers (suppliername, supplierphone, supplieraddress) VALUES (:suppliername, :supplierphone, :supplieraddress) ;'
    connection.query(query,
      {
        type: connection.QueryTypes.INSERT,
        replacements: {
          suppliername: suppliername,
          supplierphone: supplierphone,
          supplieraddress: supplieraddress
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/suppliers')
      })
  })

export default router