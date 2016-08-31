<?php

namespace Bzh\CoreBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;

class ClanType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, array(
                'label' => 'Clan ennemi'
            ))          
            ->add('tag', TextType::class, array(
                'label' => 'Tag Clan ennemi'
            ))
            ->add('level', IntegerType::class, array(
                'label' => 'Niveau clan ennemi',
                'scale' => 0
            ))
            
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Bzh\CoreBundle\Entity\Clan'
        ));
    }
}
