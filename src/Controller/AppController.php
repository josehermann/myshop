<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AppController extends AbstractController
{
    #[Route('/', name: 'accueil')]
    public function accueil(): Response
    {
        return $this->render('app/index.html.twig', [
            'controller_name' => 'AppController',
        ]);
    }
    
    
    #[Route('/app', name: 'boutique')]
    public function pro(ProduitRepository $repo): Response
    {   
        $produits = $repo->findAll();

        return $this->render('app/boutique.html.twig', [
             'produits' => $produits,
        ]);
    }
    
}
