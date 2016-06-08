
exports.seed = function(knex, Promise) {
  return Promise.join(
    // Deletes ALL existing entries
    knex('users').del(),

    // Inserts seed entries
    knex('users').insert({
      id: 1,
      first_name: 'John',
      last_name: 'Doe',
      username: 'johndoe',
      email: 'john@doe.com',
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    }),
    knex('users').insert({
      id: 2,
      first_name: 'Maggie',
      last_name: 'Turner',
      username: 'maggie',
      email: 'maggie@turner.com',
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    }),
    knex('users').insert({
      id: 3,
      first_name: 'Sam',
      last_name: 'Smith',
      username: 'sam',
      email: 'sam@smith.com',
      created_at: new Date((new Date()).getTime()),
      updated_at: new Date((new Date()).getTime())
    })
  );
};
