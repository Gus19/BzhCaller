<?php

namespace Bzh\WarBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
use Bzh\WarBundle\Form\ImageType;

class TargetCommentType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('comment', TextareaType::class, array(
                'required' => false,
                'attr' => array(
                    'class' => 'noclash',
                    'rows'  => 8
                ),
            ))
            ->add('image', ImageType::class, array(
                'required' => false,
                'label' => false
            ))
            ->add('enregistrer', SubmitType::class, array(
                'attr' => array('class' => 'btn-primary'),
            ))
            ->add('fermer', ButtonType::class, array(
                'attr' => array(
                    'class' => 'btn-default',
                    'onclick' => "$('#targetcomment').jqmHide()"
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
            'data_class' => 'Bzh\WarBundle\Entity\Target'
        ));
    }
}
