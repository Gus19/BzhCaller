<?php

namespace Bzh\WarBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Bzh\CoreBundle\Form\ClanType;

use Bzh\CoreBundle\Repository\ClanRepository;

class WarType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            //->add('code', HiddenType::class)
            //->add('size', IntegerType::class)
            ->add('size', ChoiceType::class, array(
                'label' => 'Nombre de guerriers',
                'placeholder' => 'choisissez ...',
                'choices' => array(
                    '5 VS 5' => 5, 
                    '10 VS 10' => 10, 
                    '15 VS 15' => 15, 
                    '20 VS 20' => 20, 
                    '25 VS 25' => 25, 
                    '30 VS 30' => 30, 
                    '35 VS 35' => 35, 
                    '40 VS 40' => 40, 
                    '45 VS 45' => 45, 
                    '50 VS 50' => 50
                ),
            ))
            ->add('timeChoice', ChoiceType::class, array(
                'label' => 'Dates de guerre',
                'expanded' => true,
                'choices' => array(
                    'Début dans' => 'start', 
                    'Fin dans' => 'end'
                )
            ))
            ->add('timeTo', TimeType::class, array(
                'label' => ''
            ))
            ->add('bzhClan', EntityType::class, array(
                'class' => 'BzhCoreBundle:Clan',
                'query_builder' => function (ClanRepository $er) {
                    return $er->createQueryBuilder('c')->andWhere("c.type = 1")->orderBy("c.slug");
                },
                'choice_label' => 'name'
            ))
            ->add('vsClan', ClanType::class, array(
                'label' => false
            ))
            ->add('enregistrer', SubmitType::class, array(
                'label' => '',
                'attr' => array('class' => 'btn-primary'),
            ))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Bzh\WarBundle\Entity\War'
        ));
    }
}
