var LABankdapp = artifacts.require("LABankdapp");

contract('LABankdapp', function(accounts) {
  it("addSkill", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.addSkill(accounts[0], 'test_skill');
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("getSkills", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.getSkills(accounts[0]);
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
  it("removeSkill", function() {
    return LABankdapp.deployed().then((instance) => {
      return instance.removeSkill(accounts[0], 'test_skill');
    }).then((res) => {
      assert.isTrue(true);
    }).catch(err => {
      assert.isTrue(false, err);
    });
  });
});
