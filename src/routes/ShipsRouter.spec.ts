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

describe("shipsRouter", () => {
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

  it("should return a list of ships on the planet", () => {
    const planetID = 167546850;
    return request
      .get(`/v1/ships/${planetID}`)
      .set("Authorization", authToken)
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.SUCCESS);
        expect(res.type).to.eql("application/json");
        expect(res.body.data.planetID).to.be.equals(167546850);
      });
  });

  it("should fail (planetID invalid)", () => {
    const planetID = "asdf";
    return request
      .get(`/v1/ships/${planetID}`)
      .set("Authorization", authToken)
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (planetID invalid)", () => {
    return request
      .post("/v1/ships/build")
      .set("Authorization", authToken)
      .send({ planetID: "sadf", buildOrder: { 201: 3 } })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (invalid build-order, wrong unit-key)", () => {
    return request
      .post("/v1/ships/build")
      .set("Authorization", authToken)
      .send({ planetID: 167546850, buildOrder: { hallo: 3 } })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (invalid build-order, wrong amount)", () => {
    return request
      .post("/v1/ships/build")
      .set("Authorization", authToken)
      .send({ planetID: 167546850, buildOrder: { 201: "asdf" } })
      .then(res => {
        expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
        expect(res.type).to.eql("application/json");
        expect(res.body.data).to.be.eql({});
      });
  });

  it("should fail (invalid build-order, not a ship)", () => {
    return (
      request
        .post("/v1/ships/build")
        .set("Authorization", authToken)
        // eslint-disable-next-line quotes
        .send({ planetID: 167546850, buildOrder: `{ "305": 3 }` })
        .then(res => {
          expect(res.body.status).to.be.equals(Globals.Statuscode.BAD_REQUEST);
          expect(res.type).to.eql("application/json");
          expect(res.body.data).to.be.eql({});
        })
    );
  });

  it("should add a new build-order", () => {
    return (
      request
        .post("/v1/ships/build")
        .set("Authorization", authToken)
        // eslint-disable-next-line quotes
        .send({ planetID: 167546850, buildOrder: `{ "201": 3 }` })
        .then(res => {
          expect(res.body.status).to.be.equals(Globals.Statuscode.SUCCESS);
          expect(res.type).to.eql("application/json");
          expect(res.body.data.planetID).to.be.equals(167546850);
          const buildOrders = JSON.parse(res.body.data.b_hangar_queue);
          expect(buildOrders.length).to.be.equals(1);
          expect(buildOrders[0].planetID).to.be.equals(167546850);
        })
    );
  });

  // TODO:
  // /v1/ships/build/
});