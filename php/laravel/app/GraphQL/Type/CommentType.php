<?php
namespace App\GraphQL\Type;
use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Type as GraphQLType;

class CommentType extends GraphQLType {

  protected $attributes = [
    'name' => 'Comment',
    'description' => 'A Comment'
  ];

  public function fields()
  {
    return [
      'id' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The id of the comment'
      ],
      'body' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The body of the comment'
      ],
      'user' => \App\GraphQL\Query\UserQuery::class,
    ];
  }
}
