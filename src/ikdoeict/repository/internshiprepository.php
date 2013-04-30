<?php

namespace Ikdoeict\Repository;

class InternshipRepository extends \Knp\Repository {

    public function getTableName() {
        return 'internship';
    }
    
    public function findAll(){
        return $this->db->fetchAll('select * from internship inner join internshiptemplate on internship.InternshipTemplate_ID = internshiptemplate.ID inner join facileties on internshiptemplate.Facileties_ID = facileties.ID inner join companies on facileties.CompaniesID = companies.idCompany;');   
    }

    public function find($id) {
        return $this->db->fetchAssoc('select * from internship inner join internshiptemplate on internship.InternshipTemplate_ID = internshiptemplate.ID inner join facileties on internshiptemplate.Facileties_ID = facileties.ID inner join companies on facileties.CompaniesID = companies.idCompany WHERE internship.idInternship = ?;', array($id));
    }

    public function findStages($facilityID) {
        return $this->db->fetchAll('select * from internship inner join internshipTemplate on internship.idInternshipTemplate = internshipTemplate.idIntershipTemplate inner join facilities on facilities.idfacility = internshipTemplate.idfacility where internshipTemplate.idfacility = ?;', array($facilityID));
    }

    public function findStagesFrontPage() {
        return $this->db->fetchAll('select * from internship inner join internshiptemplate on internship.InternshipTemplate_ID = internshiptemplate.ID LIMIT 8;');
    }

    public function findSectorsOfTemplate($tempateID) {
        return $this->db->fetchALl('select name from sector inner join internshiptemplate_has_sector on sector.idSector = internshiptemplate_has_sector.Sector_idSector where internshiptemplate_has_sector.InternshipTemplate_ID = ?;', array($tempateID));
    }

}