import { Router } from 'express'

import users from './users'
import products from './products'
import employees from './employees'
import customers from './customers'
import departments from './departments'
import aisles from './aisles'
import suppliers from './suppliers'

const router = Router()

// Add Routes
router.use(users)
router.use(products)
router.use(employees)
router.use(customers)
router.use(departments)
router.use(aisles)
router.use(suppliers)

export default router
