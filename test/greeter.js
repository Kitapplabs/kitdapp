var LABankdapp = artifacts.require("LABankdapp");

contract('LABankdapp', function(accounts) {
  it("set", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.setGreeter("Hello World ! I'm a blockchain developer");
    }).then(() => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("get", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.greet.call();
    }).then((greet) => {
      assert.equal(greet, "Hello World ! I'm a blockchain developer", "Not set");
    });
  });
});
