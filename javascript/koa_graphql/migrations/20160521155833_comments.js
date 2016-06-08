exports.up = function(knex, Promise) {
  return knex.schema.createTable('comments', function (table) {
    table.increments();
    table.string('body');
    table.integer('user_id');
    table.integer('post_id');
    table.foreign(['user_id', 'post_id']).references(['user_id', 'post_id']);
    table.index(['user_id', 'post_id']);
    table.timestamps();
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('comments');
};
