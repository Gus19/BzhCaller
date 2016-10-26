<?php

namespace Bzh\WarBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

class ResultAttackType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('stars', IntegerType::class, array(
                'required' => false,
                'attr' => array(
                    'min'=>0,
                    'max'=>3
                )
            ))
            ->add('destruction', IntegerType::class, array(
                'required' => false,
                'attr' => array(
                    'min'=>0,
                    'max'=>100
                )
            ))
            ->add('enregistrer', SubmitType::class, array(
                'attr' => array('class' => 'btn-primary'),
            ))
            ->add('fermer', ButtonType::class, array(
                'attr' => array(
                    'class' => 'btn-default',
                    'onclick' => "$('#resultattack').jqmHide()"
                ),
            ))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Bzh\WarBundle\Entity\Attack'
        ));
    }
}
