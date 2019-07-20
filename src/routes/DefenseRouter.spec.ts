import * as chai from "chai";
import chaiHttp = require("chai-http");

import App from "../App";
import { Globals } from "../common/Globals";
import { Planet } from "../units/Planet";

const createContainer = require("../ioc/createContainer");

const container = createContainer();

const app = new App(container).express;

chai.use(chaiHttp);
const expect = chai.expect;

let authToken = "";
let request = chai.request(app);

describe("defenseRoute", () => {
  let planetBeforeTests: Planet;

  before(async () => {
    planetBeforeTests = await container.planetService.getPlanet(1, 167546850, true);
    return request
      .post("/v1/auth/login")
      .send({ email: "user_1501005189510@test.com", password: "admin" })
      .then(res => {
        authToken = res.body.data.token;
      });
  });

  after(async () => {
    await container.planetService.updatePlanet(planetBeforeTests);
  });

  beforeEach(function() {
    request = chai.request(app);
    return;
  });

  it("should return a list of defenses", () => {
    const planetID = 167546850;

    return request
      .get(`/v1/defenses/${planetID}`)
      .set("Authorization", authToken)
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.SUCCESS);
        expect(res.type).to.eql("application/json");
        expect(res.body.data.planetID).equals(planetID);
      });
  });

  it("should return an empty list", () => {
    const planetID = 60881;

    return request
      .get(`/v1/defenses/${planetID}`)
      .set("Authorization", authToken)
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.SUCCESS);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should build defense", () => {
    const planetID = 167546850;

    return request
      .post("/v1/defenses/build")
      .set("Authorization", authToken)
      .send({ planetID, buildOrder: JSON.stringify({ 301: 1 }) })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.SUCCESS);
        expect(res.type).to.eql("application/json");
        expect(res.body.data.planetID).equals(planetID);
      });
  });

  it("should fail (missing planetID-parameter)", () => {
    return request
      .post("/v1/defenses/build")
      .set("Authorization", authToken)
      .send({ buildOrder: JSON.stringify({ 301: 1 }) })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (missing buildOrder-parameter)", () => {
    const planetID = 167546850;

    return request
      .post("/v1/defenses/build")
      .set("Authorization", authToken)
      .send({ planetID })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (no parameter)", () => {
    return request
      .post("/v1/defenses/build")
      .set("Authorization", authToken)
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (wrong buildOrder format)", () => {
    const planetID = 167546850;

    return request
      .post("/v1/defenses/build")
      .set("Authorization", authToken)
      .send({ planetID, buildOrder: "'{ \"xyz\": 1 }'" })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });
});
