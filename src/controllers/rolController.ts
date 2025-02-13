import { Request, Response } from 'express';
import { Rol } from '../models/rolModel';

class RolController {
  async getAll(req: Request, res: Response) {
    try {
      const data = await Rol.find();

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }

  async insert(req: Request, res: Response) {
    try {
      console.log(req.body);
      const data = await Rol.save(req.body);

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }
}

export default new RolController();
