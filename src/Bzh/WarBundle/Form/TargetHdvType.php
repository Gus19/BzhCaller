<?php

namespace Bzh\WarBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

class TargetHdvType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('hdv', IntegerType::class, array(
                'attr' => array(
                    'min'=>1,
                    'max'=>11
                )
            ))
            ->add('enregistrer', SubmitType::class, array(
                'attr' => array('class' => 'btn-primary')
            ))
            ->add('fermer', ButtonType::class, array(
                'attr' => array(
                    'class' => 'btn-default',
                    'onclick' => "$('#targethdv').jqmHide()"
                )
            ))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Bzh\WarBundle\Entity\Target'
        ));
    }
}
