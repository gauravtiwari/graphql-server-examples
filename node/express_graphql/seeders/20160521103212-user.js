'use strict';

module.exports = {
  up: function (queryInterface, Sequelize) {
    return queryInterface.bulkInsert('Users', [{
      first_name: 'John',
      last_name: 'Doe',
      email: 'john@doe.com',
      username: 'johndoe',
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    },
    {
      first_name: 'Maggie',
      last_name: 'Turner',
      email: 'maggie@turner.com',
      username: 'maggie',
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    }
  ], {});
  },

  down: function (queryInterface, Sequelize) {
    return queryInterface.bulkDelete('Users', null, {});
  }
};
