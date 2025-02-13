import app from './app';
import { AppDataSource } from './db/connection';
import * as dotenv from 'dotenv';

dotenv.config();

async function main() {
  try {
    await AppDataSource.initialize();

    app.listen(process.env.APP_PORT, () => {
      console.log(`SERVER ACTIVO PUERTO: ${process.env.APP_PORT}`);
    });
  } catch (error) {
    console.log(error);
    if (error instanceof Error) {
      console.log(error.message);
    }
  }
}

main();
