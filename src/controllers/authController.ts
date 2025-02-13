import { Request, Response } from 'express';
import { User } from '../models/userModel';

class AuthController {
  async login(req: Request, res: Response) {
    try {
      const { email, password } = req.body;
      const user = await User.findOne({
        where: { email },
        relations: { rol: true },
      });

      console.log('USER: ', user);

      if (!user) {
        throw new Error('Usuario no encontrado');
      }
      if (user.password != password) {
        throw new Error('Clave o usuario incorrectos');
      }

      res.status(200).json(user);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error.message);
    }
  }

  async register(req: Request, res: Response) {
    try {
      const data = await User.save(req.body);

      res.status(200).json(data);
    } catch (error) {
      if (error instanceof Error) res.status(500).send(error);
    }
  }
}

export default new AuthController();
