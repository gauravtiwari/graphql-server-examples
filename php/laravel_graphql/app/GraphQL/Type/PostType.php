<?php
namespace App\GraphQL\Type;
use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Type as GraphQLType;

class PostType extends GraphQLType {

  protected $attributes = [
    'name' => 'Post',
    'description' => 'A post'
  ];

  public function fields()
  {
    return [
      'id' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The id of the post'
      ],
      'title' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The title of the post'
      ],
      'body' => [
        'type' => Type::nonNull(Type::string()),
        'description' => 'The body of the post'
      ],
      'user' => \App\GraphQL\Query\UserQuery::class,
      'comments' => \App\GraphQL\Query\CommentsQuery::class,
    ];
  }

  public function resolve($root, $args, ResolveInfo $info)
  {
    $posts = User::query();

    $posts->with('user', 'comments');

    return $posts->get();
  }

}
