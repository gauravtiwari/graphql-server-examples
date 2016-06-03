<?php

namespace App\GraphQL\Type;
use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Type as GraphQLType;

class UserType extends GraphQLType {

  protected $attributes = [
    'name' => 'User',
    'description' => 'A user'
  ];

  public function fields()
  {
    return [
      'id' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The id of the user'
      ],
      'first_name' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The first name of the user'
      ],
      'last_name' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The last name of the user'
      ],
      'email' => [
        'type' => Type::string(),
        'description' => 'The email of user'
      ],
      'username' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The username of the user'
      ],
    ];
  }

  protected function resolveEmailField($root, $args)
  {
    return strtolower($root->email);
  }

}
