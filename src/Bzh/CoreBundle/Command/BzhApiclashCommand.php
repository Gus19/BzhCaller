<?php

namespace Bzh\CoreBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class BzhApiclashCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('bzh:apiclash')
            ->setDescription("Appel de l'API Clash of Clans et sauvegarde le JSON dans un fichier")
            ->addArgument('tag', InputArgument::REQUIRED, 'Tag du clan à rechercher')
            ->addArgument('mode', InputArgument::REQUIRED, '[clan | members | warlog]')
            ->addArgument('path', InputArgument::OPTIONAL, 'Chemin du fichier à sauvegarder')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $tag = $input->getArgument('tag');
        $mode = $input->getArgument('mode');
        $path = $input->getArgument('path');
        /* @var $service GetDatasClashOfClans */
        $service = $this->getContainer()->get('api.clash');
        switch($mode) {
            case "clan":
              $json = $service->GetClan($tag);
            break;
            case "members":
              $json = $service->GetClanMembers($tag);
            break;
            case "warlog":
              $json = $service->GetClanWarLog($tag);
            break;
            default:
                $output->writeln('<error>Mode non pris en charge</error>');
            break;
        }
      
        $output->writeln('Command result :' . $json);
    }

}
