import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET departments listing. */
router.get('/departments', function (req, res, next) {
  const query = 'SELECT * FROM Departments ORDER BY departmentname ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(departments => {
      console.log(departments)
      res.json(departments)
    })
})

/* GET aisles corresponding to a department. */
router.get('/departments/:departmentname', function (req, res, next) {
    const departmentname = req.params.departmentname
    const query = 'SELECT DISTINCT A.AisleName, AC.AisleNumber, P.DepartmentName FROM AisleContains AC, Products P, Aisles A WHERE :departmentname = P.DepartmentName AND P.ProductID = AC.ProductID AND AC.AisleNumber = A.AisleNumber ORDER BY AC.AisleNumber ASC;'
    connection.query(query,
        {
            type: connection.QueryTypes.SELECT,
            replacements: {
                departmentname: departmentname
            }
        })
        .then(aisles => {
            let itemToAdd = {'departmentname': departmentname}
            aisles.splice(0,0,itemToAdd)
            console.log(aisles)
            res.json(aisles)
        })
})

/* POST updated name for a department.*/
router.post('/departments/updateinfo', bodyParser.json(), function (req, res, next) {
    const departmentname = req.body.data.departmentname

    const query = 'UPDATE Departments SET departmentname = :departmentname WHERE departmentname = :departmentname ;'
    connection.query(query,
      {
        type: connection.QueryTypes.UPDATE,
        replacements: {
          departmentname: departmentname
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/departments')
      })
  })

  /* POST a new department.*/
  router.post('/departments/add', bodyParser.json(), function (req, res, next) {
    const departmentname = req.body.data.departmentname
  
    const query = 'INSERT INTO Departments (departmentname) VALUES (:departmentname) ;'
    connection.query(query,
      {
        type: connection.QueryTypes.INSERT,
        replacements: {
          departmentname: departmentname
        }
      })
      .then(result => {
        // result[1] is the number of rows changed
        res.send('/departments')
      })
  })

export default router