<?php

namespace App\Controller;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use App\Repository\ProductRepository;


use App\Entity\Product;


class BackendController extends AbstractController
{
    #[Route('/backend', name: 'backend')]
    public function index(ProductRepository $productRepository): Response
    {
        return $this->render('backend/index.html.twig', [
            #'controller_name' => 'BackendController',
            'products' => $productRepository->findAll(),
        ]);
    }


#[Route('/index/{filter}', name: 'filter')]
    public function filter($filter, ProductRepository $productRepository): Response
    {
        // $products = $this->getDoctrine()->getRepository(Products::class)->findBy(['type' => $filter]);
        // dd($products); 
        return $this->render('product/index.html.twig', [
            // 'products' => $products 
            'products' => $productRepository->findBy(['type' => $filter]),
            
        ]);
    }

    #[Route('/details/{id}', name: 'details')] 
    public function details($id, ProductRepository $productRepository): Response
    {
        $product = $this->getDoctrine()->getRepository('App:Product')->find($id);
        return $this->render('backend/details.html.twig', [
            "product" => $product
            
        ]);
    }

    
    #[Route('/delete/{id}', name: 'delete')]
    public function delete($id): Response
    {   $em = $this->getDoctrine()->getManager();
        $product = $em->getRepository('App:Product')->find($id);
        $em->remove($product);
        $em->flush();

        $this->addFlash('notice', 'Product Removed');

        return $this->redirectToRoute('backend');
    }

    #[Route('/create', name: 'create')] 
    public function create(Request $request): Response
    {
        $product = new Product;
        $form = $this->createFormBuilder($product)
        ->add("name", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("description", TextareaType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("price", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("image", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("size", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("material", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("type", ChoiceType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px"), "choices"=> array('Cool'=>'Cool', 'Nice'=>'Nice' , 'Sport'=>'Sport')))
        ->add("save", SubmitType::class, array('attr'=>array("class"=>"btn-outline-primary fw-light btn-sm border-1 shadow-sm rounded-pill m-3", "style"=>"margin-bottom:15px"),"label"=>"create Product"))->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $name = $form["name"]->getData();
            $description = $form["description"]->getData();
            $price = $form["price"]->getData();
            $image = $form["image"]->getData();
            $size =$form["size"]->getData();
            $material = $form["material"]->getData();
            $type = $form["type"]->getData();
            

            $product->setName($name);
            $product->setDescription($description);
            $product->setPrice($price);
            $product->setImage($image);
            $product->setSize($size);
            $product->setMaterial($material);
            $product->setType($type);
            
            

            $em = $this->getDoctrine()->getManager();

            $em->persist($product);
            $em->flush();

            $this->addFlash('notice', 'Product Added');

            return $this->redirectToRoute('backend');
        }

        return $this->render('backend/create.html.twig', [  
            "form" => $form->createView()
         ]);
    }

    #[Route('/update/{id}', name: 'update')] 
    public function update($id, Request $request): Response
    {
       
        $product = $this->getDoctrine()->getRepository('App:Product')->find($id);
        $form = $this->createFormBuilder($product)
        ->add("name", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("description", TextareaType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("price", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("image", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("size", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("material", TextType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px")))
        ->add("type", ChoiceType::class, array('attr'=>array("class"=>"form-control fw-light border-1 border-muted rounded-pill bg-light shadow-sm mt-3 text-muted", "style"=>"margin-bottom:15px"), "choices"=> array('Cool'=>'Cool', 'Nice'=>'Nice' , 'Sport'=>'Sport')))
        ->add("save", SubmitType::class, array('attr'=>array("class"=>"btn-outline-primary fw-light btn-sm border-1 shadow-sm rounded-pill m-3", "style"=>"margin-bottom:15px"),"label"=>"edit Product"))->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $name = $form["name"]->getData();
            $description = $form["description"]->getData();
            $price = $form["price"]->getData();
            $image = $form["image"]->getData();
            $size =$form["size"]->getData();
            $material = $form["material"]->getData();
            $type = $form["type"]->getData();
            

            $product->setName($name);
            $product->setDescription($description);
            $product->setPrice($price);
            $product->setImage($image);
            $product->setSize($size);
            $product->setMaterial($material);
            $product->setType($type);
            
            

            $em = $this->getDoctrine()->getManager();

            $em->persist($product);
            $em->flush();

            $this->addFlash('notice', 'Product Added');

            return $this->redirectToRoute('backend');
        }

        return $this->render('backend/update.html.twig', [  
            "form" => $form->createView()
         ]);
    }






}
