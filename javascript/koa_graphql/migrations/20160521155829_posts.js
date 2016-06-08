exports.up = function(knex, Promise) {
  return knex.schema.createTable('posts', function (table) {
    table.increments();
    table.string('title');
    table.string('body');
    table.integer('user_id');
    table.foreign('user_id').references('user_id');
    table.index('user_id');
    table.timestamps();
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('posts');
};
