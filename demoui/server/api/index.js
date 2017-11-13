import { Router } from 'express'

import users from './users'
import products from './products'
import employees from './employees'

const router = Router()

// Add Routes
router.use(users)
router.use(products)
router.use(employees)

export default router
