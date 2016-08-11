<?php
namespace Bzh\WarBundle\Services;

class CalcDateTime {
    
    public function calcDateStart($timeChoice, \DateTime $timeTo) {
        $timeToHour = (int)$timeTo->format('H');
        $timeToMinute = (int)$timeTo->format('i');

        $dateStart = new \Datetime();

        if($timeChoice == 'start') {
            $dateStart->add(new \DateInterval("PT".$timeToHour."H"));
            $dateStart->add(new \DateInterval("PT".$timeToMinute."M"));
        }
        else if ($timeChoice == 'end') {            
            $dateStart->add(new \DateInterval("PT".$timeToHour."H"));
            $dateStart->sub(new \DateInterval("P1D"));
            $dateStart->add(new \DateInterval("PT".$timeToMinute."M"));
        }
        
        return $dateStart;
    }
    
    public function calcDateEnd($timeChoice, $timeTo) {
        $timeToHour = (int)$timeTo->format('H');
        $timeToMinute = (int)$timeTo->format('i');

        $dateEnd = new \Datetime();

        if($timeChoice == 'start') {
            $dateEnd->add(new \DateInterval("PT".($timeToHour + 24)."H"));
            $dateEnd->add(new \DateInterval("PT".$timeToMinute."M"));
        }
        else if ($timeChoice == 'end') {
            $dateEnd->add(new \DateInterval("PT".$timeToHour."H"));
            $dateEnd->add(new \DateInterval("PT".$timeToMinute."M"));
        }
        
        return $dateEnd;
    }
    
    public function calcTimeBeforeStart(\DateTime $dateStart) {
        $date = time();
        $diff = $dateStart->getTimestamp() - $date;
        if($diff < 0) {
            return null;
        }
        
        return $diff;
    }
    
    public function calcTimeBeforeEnd(\DateTime $dateEnd) {
        $date = time();
        $diff = $dateEnd->getTimestamp() - $date;
        if($diff < 0) {
            return null;
        }
        
        return $diff;
    }
    
    public function textDiff($diff) {
        $tmp = $diff;
        $second = $tmp % 60;

        $tmp = floor( ($tmp - $second) /60 );
        $minute = $tmp % 60;

        $tmp = floor( ($tmp - $minute)/60 );
        $hour = $tmp % 24;
        
        return $hour.'H '.$minute.'M';
    }
    
}