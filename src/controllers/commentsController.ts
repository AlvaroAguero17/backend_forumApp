import { Request, Response } from 'express';
import { User } from '../models/userModel';
import { Comment } from '../models/commentModel';
import { Post } from '../models/postModel';

class CommentController {
  async getAll(req: Request, res: Response) {
    try {
      const data = await Comment.find();

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }

  async getOne(req: Request, res: Response) {
    try {
      console.log(req.params);
      const { id } = req.params;
      const data = await Comment.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Comentario no encontrado');
      }

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }

  async insert(req: Request, res: Response) {
    try {
      const { post, user } = req.body.data;

      const postComment = await Post.findOneBy({ id: Number(post) });

      const userComment = await User.findOneBy({ id: Number(user) });

      if (!userComment) {
        throw new Error('Usuario no encontrado');
      }

      if (!postComment) {
        throw new Error('Post no encontrado');
      }

      const data = await Comment.save(req.body.data);

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }

  async update(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const data = await Comment.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Comentario no encontrado');
      }

      await Comment.update({ id: Number(id) }, req.body);

      res.status(204);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }

  async delete(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const data = await Comment.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Comentario no encontrado');
      }

      await Comment.delete({ id: Number(id) });

      res.send(204);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }
}

export default new CommentController();
