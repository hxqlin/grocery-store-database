import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET employees listing. */
router.get('/employees', function (req, res, next) {
  const query = 'SELECT * FROM Employees ORDER BY employeeid ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(employees => {
      console.log(employees)
      res.json(employees)
    })
})

/* GET employee by ID. */
router.get('/employees/:employeeid', function (req, res, next) {
  const employeeid = req.params.employeeid
  const query = 'SELECT * FROM Employees WHERE employeeid = :employeeid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        employeeid: employeeid
      }
    })
    .then(employee => {
      if (employee.length === 1 ) {
        res.json(employee[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.post('/employees/add', bodyParser.json(), function (req, res, next) {
  const employeeid = req.body.data.employeeid
  const employeename = req.body.data.employeename
  const password = req.body.data.password

  const query = 'INSERT INTO Employees (employeename, password) VALUES (:employeename, :password) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        employeename: employeename,
        password: password
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/employees')
    })
})

export default router
