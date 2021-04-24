<?php 

namespace App;

use App\Entity\Comment;
use Symfony\Contracts\HttpClient\HttpClientInterface;

// class SpamChecker
// {
//     private $client;
//     private $endpoint;

//     public function __construct(HttpClientInterface $client, string $askismetKey)
//     {
//         $this->client = $client;
//         $this->endpoint = sprintf('https://%s.rest.akismet.com/1.1/comment-check', $askismetKey);
//     }

//     public function getSpamScore(Comment $comment, array $context):int {
//         $response = $this->client->request('POST', $this->endpoint, [
//             'body' => array_merge($context, [
//                 'blog' => 
//             ])
//         ])
//     }
// }


//NOTE: để dùng cần cho trang này online nên bỏ qua bước 16