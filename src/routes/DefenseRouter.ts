import {Router, Request, Response, NextFunction} from 'express';
import { Database } from '../common/Database';
import { Validator } from "../common/ValidationTools";
import { IAuthorizedRequest } from "../interfaces/IAuthorizedRequest"


const squel = require("squel");
const validator = new Validator();

export class DefenseRouter {
    router: Router;

    /**
     * Initialize the Router
     */
    constructor() {
        this.router = Router();
        this.init();
    }


    public getAllDefensesOnPlanet(request: IAuthorizedRequest, response: Response, next: NextFunction) {

        if(!validator.isSet(request.params.planetID) ||
            !validator.isValidInt(request.params.planetID)) {

            response.json({
                status: 400,
                message: "Invalid parameter",
                data: {}
            });
            return;
        }

        let query : string = squel.select()
                                .field("p.ownerID", "ownerID")
                                .field("d.*")
                                .from("defenses", "d")
                                .left_join("planets", "p", "d.planetID = p.planetID")
                                .where("d.planetID = ?", request.params.planetID)
                                .toString();

        Database.getConnection().query(query, function (err, result) {

            let data;

            if(!validator.isSet(result) || parseInt(result[0].ownerID) !== parseInt(request.userID)) {
                data = {};
            } else {
                data = result[0];
            }

            // return the result
            response.json({
                status: 200,
                message: "Success",
                data: data
            });

            return;

        });
    }

    /**
     * Take each handler, and attach to one of the Express.Router's
     * endpoints.
     */
    init() {
        this.router.get('/:planetID', this.getAllDefensesOnPlanet);
        // this.router.get('/get/:planetID/:buildingID', this.getBuildingById);
    }

}

const defenseRoutes = new DefenseRouter();
defenseRoutes.init();

export default defenseRoutes.router;
