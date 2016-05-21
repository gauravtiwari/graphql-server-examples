
exports.seed = function(knex, Promise) {
  return Promise.join(
    // Deletes ALL existing entries
    knex('posts').del(),

    // Inserts seed entries
    knex('posts').insert({
      id: 1,
      title: 'First post title',
      body: 'First post body',
      user_id: 1,
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    }),
    knex('posts').insert({
      id: 2,
      title: 'Second post title',
      body: 'Second post body',
      user_id: 2,
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    }),
    knex('posts').insert({
      id: 3,
      title: 'Third post title',
      body: 'Third post body',
      user_id: 3,
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    })
  );
};
