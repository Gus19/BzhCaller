<?php

namespace Bzh\WarBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ResultWarType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('starsBzh')
            ->add('starsVs')
            ->add('destructionBzh')
            ->add('destructionVs')
            ->add('result', ChoiceType::class, array(
                'placeholder' => 'choisissez ...',
                'choices' => array(
                    'Victoire' => 'V',
                    'Nul' => 'N',
                    'Défaite' => 'D' 
                )    
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
