<?php
namespace App\GraphQL\Query;
use GraphQL;
use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Query;

class PostQuery extends Query {

  protected $attributes = [
    'name' => 'Post query'
  ];

  public function type()
  {
    return Type::nonNull(GraphQL::type('post'));
  }

  public function resolve($root, $args)
  {
    return $root->post;
  }

}
