'use strict';

module.exports = {
  up: function (queryInterface, Sequelize) {
    return queryInterface.bulkInsert('Comments', [{
      body: 'First post comment',
      UserId: 1,
      PostId: 1,
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    },
    {
      body: 'First post second comment',
      UserId: 1,
      PostId: 1,
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    },
    {
      body: 'Second post first comment',
      UserId: 2,
      PostId: 2,
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    }
  ], {});
  },

  down: function (queryInterface, Sequelize) {
    queryInterface.bulkDelete('Comments', null, {});
  }
};
