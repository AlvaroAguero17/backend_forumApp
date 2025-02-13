import { Request, Response } from 'express';
import { Post } from '../models/postModel';
import { Comment } from '../models/commentModel';

class PostController {
  async getAll(req: Request, res: Response) {
    try {
      const data = await Post.find({
        relations: { comments: { user: true }, user: true },
        order: { createdAt: 'DESC' },
      });

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }

  async getOne(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const data = await Post.findOne({
        where: { id: Number(id) },
        relations: { comments: { user: true }, user: true },
      });

      if (!data) {
        throw new Error('Post no encontrado');
      }

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }

  async insert(req: Request, res: Response) {
    try {
      const data = await Post.save(req.body);

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }

  async update(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const data = await Post.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Post no encontrado');
      }

      await Post.update({ id: Number(id) }, req.body);

      res.send(204);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }

  async delete(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const comments = await Comment.find({
        where: { post: { id: Number(id) } },
      });

      const data = await Post.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Post no encontrado');
      }
      if (comments) {
        const idsToDelete = comments.map((item) => item.id);
        await Comment.delete(idsToDelete);
      }

      await Post.delete({ id: Number(id) });

      res.send(204);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }
}

export default new PostController();
