import express from 'express';

import RolController from '../controllers/rolController';

const router = express.Router();

router.get('/', RolController.getAll);
router.post('/', RolController.insert);

export default router;
