<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Produit;
use App\Form\ProduitType;
use App\Repository\UserRepository;
use App\Repository\ProduitRepository;
use App\Repository\CommandeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\DependencyInjection\Loader\Configurator\form;


class AdminController extends AbstractController
{
    #[Route('/admin', name: 'app_admin')]
    public function index(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
       
         ]);
    }

    #[Route('/admin/user',name: 'app_admin_gestion_users')]
    public function user(UserRepository $repo): Response
    {
        $users = $repo->findAll();
        return $this->render('admin/membre.html.twig',[
            'users'=>$users,
            
        ]);
    }
    #[Route('/admin/commande',name: 'app_admin_gestion_commandes')]
    public function commande(CommandeRepository $repo): Response
    {
        $commandes = $repo->findAll();
        return $this->render('admin/commande.html.twig',[
            'commandes'=>$commandes,
            
        ]);
    }


    #[Route('/admin/user_edit',name: 'app_admin_gest_m_edit')]
    public function usedit(UserRepository $repo): Response
    {
        $users = $repo->findAll();
        return $this->render('admin/m_modifier.html.twig',[
            'users'=>$users,
            
        ]);
    }
    #[Route('/admin/supr_',name: 'app_admin_user_delete')]
    public function usedelete(UserRepository $repo): Response
    {
        $users = $repo->findAll();
        return $this->render('admin/m_delete.html.twig',[
            'users'=>$users,
            
        ]);
    }
    #[Route('/admin/all_produits',name: 'app_admin_gestion_produits')]

    public function prod(ProduitRepository $repo): Response
    {
        $produits = $repo->findAll();
        return $this->render('admin/produit.html.twig',[
            'produits'=>$produits,
            
        ]);
    }

    
    #[Route('/admin/produit/update/{id}',name: "admin_produit_update")]
    #[Route('/admin/produit/new',name: "admin_produit_new")]
    public function form(Request $request, EntityManagerInterface $manager, Produit $produit = null)
    {
        
        if($produit == null)
        {
            $produit =  new Produit ;
            
        }
       
      
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            $produit->setDateEnregistrement(new \DateTime);
            $manager->persist($produit);
            $manager->flush();
            return $this->redirectToRoute('app_admin_gestion_produits');
            
        }
        return $this->render('admin/formProduit.html.twig',[
            'form'=> $form,
            'editMode' =>$produit->getId()!=null,
            'produit' => $produit
        ]);
        
    
    }   

    #[Route('/produit/delete/{id}',name: "admin_produit_delete")]
    public function deleteProduit(Produit $produit,EntityManagerInterface $manager)
    {
        $manager->remove($produit);
        $manager->flush();
        return $this->redirectToRoute('app_admin_gestion_produits');


     }
    // #[Route('/produit/panier',name: "app_produit_panier")]
    // public function proselec(Produit $produit,EntityManagerInterface $manager)
    // {
    //     $manager->remove($produit);
    //     $manager->flush();
    //     return $this->redirectToRoute('app_admin_gestion_produits');


    // }

    
    

}