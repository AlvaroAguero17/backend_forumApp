import express from 'express';
import PostController from '../controllers/postController';
import postController from '../controllers/postController';

const router = express.Router();

router.get('/', postController.getAll);
router.get('/:id', postController.getOne);
router.post('/', postController.insert);
router.patch('/:id', postController.update);
router.delete('/:id', postController.delete);

export default router;
