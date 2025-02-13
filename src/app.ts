import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import * as dotenv from 'dotenv';
import userRoutes from './routes/userRoutes';
import authRoutes from './routes/authRoutes';
import postRoutes from './routes/postRoutes';
import commentRoutes from './routes/commentsRoutes';
import rolRoutes from './routes/rolRoutes';

dotenv.config();

const app = express();
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/users', userRoutes);
app.use('/auth', authRoutes);
app.use('/post', postRoutes);
app.use('/comment', commentRoutes);
app.use('/rol', rolRoutes);

export default app;
