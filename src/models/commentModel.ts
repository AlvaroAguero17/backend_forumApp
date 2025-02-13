import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToMany,
  JoinTable,
  ManyToOne,
  BaseEntity,
  JoinColumn,
} from 'typeorm';
import { User } from './userModel';
import { Post } from './postModel';

@Entity('Comment')
export class Comment extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column('text')
  message: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updateddAt: Date;

  @ManyToOne(() => Post, (post) => post.comments, { cascade: true })
  @JoinColumn({ name: 'postId' })
  post: Post;

  @ManyToOne(() => User, (user) => user.comments)
  @JoinColumn({ name: 'userId' })
  user: User;
}
