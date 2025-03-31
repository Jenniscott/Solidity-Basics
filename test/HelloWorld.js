const { expect } = require("chai");

describe("HelloWorld Contract", function () {
    let HelloWorld, helloWorld, owner, addr1;

    beforeEach(async function () {
        // Get contract factory and deploy
        HelloWorld = await ethers.getContractFactory("HelloWorld");
        [owner, addr1] = await ethers.getSigners();
        helloWorld = await HelloWorld.deploy();
        await helloWorld.waitForDeployment();
    });

    it("Should set the initial message", async function () {
        expect(await helloWorld.message()).to.equal("Hello, World!");
    });

    it("Should update the message", async function () {
        await helloWorld.updateMessage("New Message");
        expect(await helloWorld.message()).to.equal("New Message");
    });

    it("Should update lastUpdater address", async function () {
        await helloWorld.connect(addr1).updateMessage("Another Message");
        expect(await helloWorld.lastUpdater()).to.equal(addr1.address);
    });

    it("Should reject duplicate messages", async function () {
        await expect(
            helloWorld.updateMessage("Hello, World!")
        ).to.be.revertedWith("New message cannot be the same as the current message");
    });
});
