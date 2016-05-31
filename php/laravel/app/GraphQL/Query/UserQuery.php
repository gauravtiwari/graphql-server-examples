<?php
namespace App\GraphQL\Query;
use GraphQL;
use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Query;

class UserQuery extends Query {

  protected $attributes = [
    'name' => 'User query'
  ];

  public function type()
  {
    return Type::nonNull(GraphQL::type('user'));
  }

  public function resolve($root, $args)
  {
    return $root->user;
  }

}
