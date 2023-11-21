import { createPool } from "mysql2/promise";
export const pool = createPool({
    host: "localhost",
    user: "root",
    password: "Hernandexz2001",
    database: "banco"
})