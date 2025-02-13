import express from 'express';
import UserController from '../controllers/userController';

const router = express.Router();

router.get('/', UserController.getAll);
router.get('/:id', UserController.getOne);
router.put('/:id', UserController.update);

export default router;
