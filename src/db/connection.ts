import * as dotenv from 'dotenv';
import { DataSource } from 'typeorm';
import { Post } from '../models/postModel';
import { User } from '../models/userModel';
import { Rol } from '../models/rolModel';
import { Comment } from '../models/commentModel';

dotenv.config();

export const AppDataSource = new DataSource({
  type: 'postgres',
  host: 'localhost',
  port: 5432,
  username: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  logging: true,
  entities: [Post, User, Rol, Comment],
  synchronize: true,
});
