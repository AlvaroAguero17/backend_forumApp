import express from 'express';
import CommentController from '../controllers/commentsController';

const router = express.Router();

router.post('/', CommentController.insert);
router.patch('/:id', CommentController.update);
router.delete('/:id', CommentController.delete);

export default router;
