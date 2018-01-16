var LABankdapp = artifacts.require("LABankdapp");

contract('LABankdapp', function(accounts) {
  it("getUser", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.getUser(0);
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("insertUser", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.insertUser.call();
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
});
