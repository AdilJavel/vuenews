<?php

require_once __DIR__.'/../bootstrap/app.php';

use Illuminate\Support\Facades\DB;




$router->get('/', function () use ($router){
    return 'Hello, world!';
});

$router->get('/api/articles', function () use ($router) {
  $articles = DB::select('SELECT * FROM articles');
  return response()->json($articles);
});


$router->get('/api/article/{id}', function ($id) use ($router) {
  $article = DB::select('SELECT * FROM articles WHERE id = ?', [$id]);
  if (count($article) > 0) {
    $comments = $article[0]->comments;
    $comments = str_replace(array('{', '}'), '', $comments);
    $commentsArray = explode(',', $comments);
    $commentsArray = array_reverse($commentsArray);
    $article[0]->comments = $commentsArray;
    return response()->json($article[0]);
  } else {
    return response()->json(['error' => 'Article not found'], 404);
  }
});

$router->post('/api/article/create', function (Illuminate\Http\Request $request) use ($router) {
  $title = $request->input('title');
  $image = $request->input('image');
  $content = $request->input('content');
  $author = $request->input('author');

  $result = DB::insert('INSERT INTO articles (title, image, content, author) VALUES (?, ?, ?, ?)', [$title, $image, $content, $author]);

  if ($result) {
    return response()->json(['success' => 'New article created'], 201);
  } else {
    return response()->json(['error' => 'Failed to create new article'], 500);
  }
});

$router->put('/api/article/{id}/views', function ($id) use ($router) {
  DB::update('UPDATE articles SET views = views + 1 WHERE id = ?', [$id]);
  $views = DB::selectOne('SELECT views FROM articles WHERE id = ?', [$id]);

  if ($views) {
    return response()->json(['views' => $views->views]);
  } else {
    return response()->json(['error' => 'Article not found'], 404);
  }
});

$router->put('/api/article/{id}/comments', function ($id) use ($router) {
  $comment = json_decode(file_get_contents('php://input'))->comment;
  DB::update('UPDATE articles SET comments = array_append(comments, ?) WHERE id = ?', [$comment, $id]);
  $comments = DB::selectOne('SELECT comments FROM articles WHERE id = ?', [$id]);
  return response()->json($comments);
});

$router->put('/api/article/{id}/likes', function ($id) use ($router) {
  DB::update('UPDATE articles SET likes = likes + 1 WHERE id = ?', [$id]);
  $likes = DB::selectOne('SELECT likes FROM articles WHERE id = ?', [$id]);

  if ($likes) {
    return response()->json(['likes' => $likes->likes]);
  } else {
    return response()->json(['error' => 'Article not found'], 404);
  }
});





  



