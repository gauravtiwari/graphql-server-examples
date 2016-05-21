'use strict';

module.exports = {
  up: function (queryInterface, Sequelize) {
    return queryInterface.bulkInsert('Posts', [{
      title: 'First post title',
      body: 'First post body',
      UserId: 1,
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    },
    {
      title: 'Second post title',
      body: 'Second post body',
      UserId: 2,
      createdAt: new Date((new Date()).getTime()),
      updatedAt: new Date((new Date()).getTime())
    }
  ], {});
  },

  down: function (queryInterface, Sequelize) {
    queryInterface.bulkDelete('Posts', null, {});
  }
};
