
exports.seed = function(knex, Promise) {
  return Promise.join(
    // Deletes ALL existing entries
    knex('comments').del(),

    // Inserts seed entries
    knex('comments').insert({
      id: 1,
      body: 'First post comment',
      user_id: 1,
      post_id: 1,
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    }),
    knex('comments').insert({
      id: 2,
      body: 'Second post comment',
      user_id: 2,
      post_id: 2,
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    }),
    knex('comments').insert({
      id: 3,
      body: 'Third post comment',
      user_id: 3,
      post_id: 3,
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    })
  );
};
