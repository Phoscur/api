import mysql = require("mysql2");
import { Logger } from "./Logger";

require("dotenv-safe").config();

/***
 * Manages the connection to the (mysql/mariaDB)-database
 */
class Database {

    /***
     * The static objects that holds the connection
     */
    private static connection : mysql = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        database: process.env.DB_NAME,
        password: process.env.DB_PASS,
        port: process.env.DB_PORT
    })
    .on("error", (err : string) : void => {
        Logger.error(err);
    });


    /***
     * Returns the current connection to the mysql-database
     */
    public static getConnection() : any {
        return this.connection;
    }

    /***
     * Returns a promise for a query
     * @param sql
     * @param args
     */
    public static query(sql : string, args : object = null) : Promise<any> {
        Logger.info(sql);

        return new Promise((resolve : any, reject : any) : any => {
            return this.connection.query(sql, args, (err : any, rows : any) => {
                    if (err) return reject(err);
                    resolve(rows);
                });
            }
        ).catch((err : string) => {
            //Logger.error(err);
            return Promise.reject(err);
        });
    }

}

export { Database };