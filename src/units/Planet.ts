import { Database } from '../common/Database';
import { IUnits } from '../interfaces/IUnits';
const squel = require("squel");
const Logger = require('../common/Logger');



enum Type {
    Planet = 1,
    Moon = 2
}

class Planet implements IUnits {

    public planetID : number;
    public ownerID: number;
    public name : string;
    public galaxy : number;
    public system : number;
    public planet :number;
    public last_update: number;
    public planet_type : Type;
    public image : string;
    public diameter : number;
    public fields_current : number;
    public fields_max : number;
    public temp_min : number;
    public temp_max : number;
    public metal : number;
    public crystal : number;
    public deuterium : number;
    public energy_used : number;
    public energy_max : number;
    public metal_mine_percent : number;
    public crystal_mine_percent : number;
    public deuterium_synthesizer_percent : number;
    public solar_plant_percent : number;
    public fusion_reactor_percent : number;
    public solar_satellite_percent : number;
    public b_building_id : number;
    public b_building_endtime : number;
    public b_tech_id : number;
    public b_tech_endtime : number;
    public b_hangar_id : number;
    public b_hangar_start_time : number;
    public b_hangar_plus : boolean;
    public destroyed : boolean;


    public save() : Promise<{}> {
        return new Promise((resolve, reject) => {

            let query = squel.update()
                .table("planets")
                .set("name", this.name)
                .set("galaxy", this.galaxy)
                .set("system", this.system)
                .set("planet", this.planet)
                .set("last_update", this.last_update)
                .set("fields_current", this.fields_current)
                .set("fields_max", this.fields_max)
                .set("metal", this.metal)
                .set("crystal", this.crystal)
                .set("deuterium", this.deuterium)
                .set("energy_used", this.energy_used)
                .set("energy_max", this.energy_max)
                .set("metal_mine_percent", this.metal_mine_percent)
                .set("crystal_mine_percent", this.crystal_mine_percent)
                .set("deuterium_synthesizer_percent", this.deuterium_synthesizer_percent)
                .set("solar_plant_percent", this.solar_plant_percent)
                .set("fusion_reactor_percent", this.fusion_reactor_percent)
                .set("solar_satellite_percent", this.solar_satellite_percent)
                .set("b_building_id", this.b_building_id)
                .set("b_building_endtime", this.b_building_endtime)
                .set("b_tech_id", this.b_tech_id)
                .set("b_tech_endtime", this.b_tech_endtime)
                .set("b_hangar_id", this.b_hangar_id)
                .set("b_hangar_start_time", this.b_hangar_start_time)
                .set("b_hangar_plus", this.b_hangar_plus)
                .set("destroyed", this.destroyed)
                .where("planetID = ?", this.planetID)
                .toString();

            Database.query(query).then(() => {
                return resolve(this);
            }).catch(error => {
                Logger.error(error);
                return reject(error);
            });

        });
    }

    public create() : Promise<{}> {
        return new Promise((resolve, reject) => {
            let query = squel.update()
                .table("planets")
                .set("planetID", this.planetID)
                .set("name", this.name)
                .set("galaxy", this.galaxy)
                .set("system", this.system)
                .set("planet", this.planet)
                .set("last_update", this.last_update)
                .set("fields_current", this.fields_current)
                .set("fields_max", this.fields_max)
                .set("metal", this.metal)
                .set("crystal", this.crystal)
                .set("deuterium", this.deuterium)
                .set("energy_used", this.energy_used)
                .set("energy_max", this.energy_max)
                .set("metal_mine_percent", this.metal_mine_percent)
                .set("crystal_mine_percent", this.crystal_mine_percent)
                .set("deuterium_synthesizer_percent", this.deuterium_synthesizer_percent)
                .set("solar_plant_percent", this.solar_plant_percent)
                .set("fusion_reactor_percent", this.fusion_reactor_percent)
                .set("solar_satellite_percent", this.solar_satellite_percent)
                .set("b_building_id", this.b_building_id)
                .set("b_building_endtime", this.b_building_endtime)
                .set("b_tech_id", this.b_tech_id)
                .set("b_tech_endtime", this.b_tech_endtime)
                .set("b_hangar_id", this.b_hangar_id)
                .set("b_hangar_start_time", this.b_hangar_start_time)
                .set("b_hangar_plus", this.b_hangar_plus)
                .set("destroyed", this.destroyed)
                .toString();

            Database.query(query).then(() => {
                return resolve(this);
            }).catch(error => {
                Logger.error(error);
                return reject(error);
            });
        });
    }

    isValid() : boolean {
        return false;
    }

}

export { Planet }