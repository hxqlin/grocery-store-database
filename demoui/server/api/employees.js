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
  const query = 'SELECT * FROM Employees WHERE employeeid = :employeeid ORDER BY employeeid ASC;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        employeeid: employeeid
      }
    })
    .then(employees => {
      if (employees.length === 1 ) {
        res.json(employees[0])
      } else {
        res.status(404).json({})
      }
    })
})

/* POST a new employee. */
router.post('/employees/add', bodyParser.json(), function (req, res, next) {
  const employeename = req.body.data.employeename
  const departmentname = req.body.data.departmentname
  const position = req.body.data.position
  const sinumber = req.body.data.sinumber
  const employeeaddress = req.body.data.employeeaddress
  const employeephone = req.body.data.employeephone
  const wage = req.body.data.wage

  const query = 'INSERT INTO Employees (employeename, departmentname, position, sinumber, employeeaddress, employeephone, wage) VALUES (:employeename, :departmentname, :position, :sinumber, :employeeaddress, :employeephone, :wage);'

  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {

        employeename: employeename,
        departmentname: departmentname, 
        position: position, 
        wage: wage, 
        sinumber: sinumber, 
        employeeaddress: employeeaddress, 
        employeephone: employeephone
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/employees')
    })
})

/* POST updated employee information. */
router.post('/employees/update', bodyParser.json(), function (req, res, next) {
  const employeeid = req.body.data.employeeid
  const employeename = req.body.data.employeename
  const departmentname = req.body.data.departmentname
  const position = req.body.data.position
  const wage = req.body.data.wage
  const employeeaddress = req.body.data.employeeaddress
  const employeephone = req.body.data.employeephone

  const query = 'UPDATE Employees SET employeename = :employeename, departmentname = :departmentname, position = :position, wage = :wage, employeephone = :employeephone, employeeaddress = :employeeaddress WHERE employeeid = :employeeid ;'
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

/* POST to remove an employee. */
router.post('/employees/delete', bodyParser.json(), function (req, res, next) {
  const employeeid = req.body.data.employeeid

  const query = 'DELETE FROM Employees WHERE employeeid = :employeeid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        employeeid: employeeid
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/employees')
    })
})


export default router
