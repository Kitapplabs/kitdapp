var LABankdapp = artifacts.require("LABankdapp");

contract('LABankdapp', function(accounts) {
  it("name", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.name.call();
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("symbol", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.symbol.call();
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("decimals", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.decimals.call();
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("balanceOf", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.balanceOf(accounts[1]);
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("transfer", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.transfer(accounts[1], 500);
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("reduce", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.reduce(accounts[1], 250);
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
});
