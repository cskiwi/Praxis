<?php

namespace Ikdoeict\Repository;

class InternshipRepository extends \Knp\Repository {

    public function getTableName() {
        return 'internship';
    }
    
    public function findAll(){
        return $this->db->fetchAll('select * from internship inner join internshipTemplate on internship.idInternshipTemplate = internshipTemplate.idIntershipTemplate inner join facilities on internshiptemplate.idFacility = facilities.idFacility inner join companies on facilities.idCompany = companies.idCompany;');   
    }

    public function find($id) {
        return $this->db->fetchAssoc('select * from internship inner join internshiptemplate on internship.idInternshipTemplate = internshipTemplate.idIntershipTemplate inner join facilities on internshiptemplate.idFacility = facilities.idFacility inner join companies on facilities.idCompany = companies.idCompany WHERE internship.idInternship = ?;', array($id));
    }

    public function findStages($facilityID) {
        return $this->db->fetchAll('select * from internship inner join internshipTemplate on internship.idInternshipTemplate = internshipTemplate.idIntershipTemplate inner join facilities on facilities.idfacility = internshipTemplate.idfacility where internshipTemplate.idfacility = ?;', array($facilityID));
    }

    public function findStagesFrontPage() {
        return $this->db->fetchAll('select * from internship inner join internshipTemplate on internship.idInternshipTemplate = internshipTemplate.idIntershipTemplate LIMIT 8;');
    }

    public function findSectorsOfTemplate($tempateID) {
        return $this->db->fetchALl('select name from sector inner join internshiptemplate_has_sector on sector.idSector = internshiptemplate_has_sector.idSector where internshiptemplate_has_sector.idInternshipTemplate = ?;', array($tempateID));
    }

}