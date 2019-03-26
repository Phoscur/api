import {Router, Request, Response, NextFunction} from 'express';
import { Database } from '../common/Database';
import { InputValidator } from "../common/InputValidator";
import { IAuthorizedRequest } from "../interfaces/IAuthorizedRequest"


const squel = require("squel");

export class TechsRouter {
    router: Router;

    /**
     * Initialize the Router
     */
    constructor() {
        this.router = Router();
        this.init();
    }


    /**
     * Returns all technologies of a given user
     * @param request
     * @param response
     * @param next
     */
    public getTechs(request: IAuthorizedRequest, response: Response, next: NextFunction) {

        if(!InputValidator.isSet(request.params.playerID) ||
            !InputValidator.isValidInt(request.params.playerID)) {

            response.json({
                status: 400,
                message: "Invalid parameter",
                data: {}
            });

            return;
        }

        let query : string = squel.select()
                                .from("techs")
                                .where("userID = ?", request.params.playerID)
                                .toString();

        Database.getConnection().query(query, function(err, result) {

            // return the result
            response.json({
                status: 200,
                message: "Success",
                data: result
            });
            return;

        });
    }

    /***
     * Initializes the routes
     */
    init() {
        this.router.get('/:playerID', this.getTechs);
    }

}

const techsRouter = new TechsRouter();
techsRouter.init();

export default techsRouter.router;
