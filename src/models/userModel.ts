import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  OneToMany,
  ManyToOne,
  BaseEntity,
  JoinColumn,
} from 'typeorm';
import { Post } from './postModel';
import { Rol } from './rolModel';
import { Comment } from './commentModel';

@Entity('User')
export class User extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  username: string;

  @Column()
  email: string;

  @Column()
  password: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updateddAt: Date;

  @OneToMany(() => Post, (post) => post.user)
  posts: Post[];

  @OneToMany(() => Comment, (comment) => comment.user)
  comments: Comment[];

  @ManyToOne(() => Rol, (rol) => rol.users)
  @JoinColumn({ name: 'rolId' })
  rol: Rol;
}
