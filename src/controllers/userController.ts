import { Request, Response } from 'express';
import { User } from '../models/userModel';

class UserController {
  async getAll(req: Request, res: Response) {
    try {
      const data = await User.find();

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }
  async getOne(req: Request, res: Response) {
    try {
      console.log(req.params);
      const { id } = req.params;
      const data = await User.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Usuario no encontrado');
      }

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }

  async update(req: Request, res: Response) {
    try {
      console.log(req.params);
      const { id } = req.params;
      const data = await User.findOneBy({ id: Number(id) });

      if (!data) {
        throw new Error('Usuario no encontrado');
      }

      await User.update({ id: Number(id) }, req.body);

      res.send(204);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }
}

export default new UserController();
