<?php

namespace Bzh\CoreBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Ivory\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

class ClanDescriptionType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('description', CKEditorType::class, array(
                'config_name' => 'my_config',
            ))
            ->add('enregistrer', SubmitType::class, array(
                'attr' => array('class' => 'btn-primary'),
            ))
            ->add('fermer', ButtonType::class, array(
                'attr' => array(
                    'class' => 'btn-default',
                    'onclick' => "$('#clandescription').jqmHide()"
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
            'data_class' => 'Bzh\CoreBundle\Entity\Clan'
        ));
    }
}
