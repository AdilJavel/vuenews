<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Cross-Origin Resource Sharing (CORS) Configuration
    |--------------------------------------------------------------------------
    |
    | Here you may configure your settings for CORS requests, such as which
    | origins and methods are allowed. You may also specify how long the
    | results of a preflight request should be cached by the browser.
    |
    */

    'paths' => ['api/*'],

    'allowed_methods' => ['*'],

    'allow_origins' => ['*'],

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['Content-Type', 'Authorization'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => false,

];

