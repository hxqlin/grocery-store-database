import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET employees listing. */
router.get('/employees', function (req, res, next) {
  const query = 'SELECT * FROM Employee ORDER BY employeeid ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(employees => {
      console.log(employees)
      res.json(employees)
    })
})

/* GET employee by ID. */
router.get('/employees/:employeeid', function (req, res, next) {
  const employeeid = req.params.employeeid
  const query = 'SELECT * FROM Employee WHERE employeeid = :employeeid ;'
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
  const departmentname  = req.body.data.departmentname
  const position = req.body.data.position
  const wage = req.body.data.wage
  const SINumber = req.body.data.SINumber
  const employeeaddress = req.body.data.employeeaddress
  const employeephone  = req.body.data.employeephone

  const query = 'INSERT INTO Employee (employeeid, employeename, departmentname, position, wage, SINumber, employeeaddress, employeephone) VALUES (:employeeid, :employeename, :departmentname, :position, :wage, :SINumber, :employeeaddress, :employeephone) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        employeename: employeename,
        employeeid: employeeid, 
        departmentname: departmentname, 
        position: position, 
        wage: wage, 
        SINumber: SINumber, 
        employeeaddress: employeeaddress, 
        employeephone: employeephone
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/employees')
    })
})

router.post('/employees/update', bodyParser.json(), function (req, res, next) {
  const employeeid = req.body.data.employeeid
  const employeename = req.body.data.employeename
  const departmentname = req.body.data.departmentname
  const position = req.body.data.position
  const wage = req.body.data.wage
  const employeeaddress = req.body.data.employeeaddress
  const employeephone = req.body.data.employeephone

  const query = 'UPDATE Employee SET employeename = :employeename, departmentname = :departmentname, position = :position, wage = :wage, employeephone = :employeephone, employeeaddress = :employeeaddress WHERE employeeid = :employeeid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        employeename: employeename,
        departmentname: departmentname,
        position: position,
        wage: wage,
        employeeaddress: employeeaddress,
        employeephone: employeephone,
        employeeid: employeeid
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/employees')
    })
})


export default router
