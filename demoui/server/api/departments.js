import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET customers listing. */
router.get('/departments', function (req, res, next) {
  const query = 'SELECT * FROM Departments ORDER BY departmentname ASC;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(departments => {
      console.log(departments)
      res.json(departments)
    })
})

// /* GET departments by ID. */
// router.get('/departments/:departmentname', function (req, res, next) {
//   const departmentname = req.params.departmentname
//   const query = 'SELECT * FROM Departments WHERE departmentname = :departmentname ;'
//   connection.query(query,
//     {
//       type: connection.QueryTypes.SELECT,
//       replacements: {
//         departmentname: departmentname
//       }
//     })
//     .then(departments => {
//       if (departments.length === 1 ) {
//         res.json(departments[0])
//       } else {
//         res.status(404).json({})
//       }
//     })
// })


/* GET aisle by DepartmentName. */
router.get('/departments/:departmentname', function (req, res, next) {
    const departmentname = req.params.departmentname
    const query = 'SELECT DISTINCT AC.AisleNumber, P.DepartmentName FROM AisleContains AC, Products P, Departments D WHERE :departmentname = P.DepartmentName AND P.ProductID = AC.ProductID ORDER BY AC.AisleNumber ASC;'
    connection.query(query,
        {
            type: connection.QueryTypes.SELECT,
            replacements: {
                departmentname: departmentname
            }
        })
        .then(aisles => {
            console.log("Here are the aisles")
            console.log(aisles)
            if(aisles.length === 0)
                res.status(404).json({})
            else
                res.json(aisles)
        })
})

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