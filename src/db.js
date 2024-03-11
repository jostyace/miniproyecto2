import mysql from 'mysql2/promise'
import dotenv from 'dotenv'

dotenv.config()

export const pool = mysql.createPool({
  connectionLimit: 10,
  host: 'localhost',
  user: 'usuario',
  password: 'P@$$w0rd',
  database: 'empresa'
})
