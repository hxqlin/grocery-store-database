import { Router } from 'express'

import users from './users'
import products from './products'
import employees from './employees'
import customers from './customers'
import departments from './departments'
import aisles from './aisles'

const router = Router()

// Add Routes
router.use(users)
router.use(products)
router.use(employees)
router.use(customers)
router.use(departments)
router.use(aisles)

export default router
