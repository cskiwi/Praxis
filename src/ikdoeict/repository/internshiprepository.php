<?php

namespace Ikdoeict\Repository;

class InternshipRepository extends \Knp\Repository {

    public function getTableName() {
        return 'internship';
    }

    public function find($id) {
        return $this->db->fetchAssoc('select * from internship inner join internshiptemplate on internship.InternshipTemplate_ID = internshiptemplate.ID WHERE internship.idInternship = ?;', array($id));
    }

    public function findStages($CompanyID) {
        return $this->db->fetchAll('select * from internship inner join internshiptemplate on internship.InternshipTemplate_ID = internshiptemplate.ID where Facileties_ID = ?;', array($CompanyID));
    }

    public function findStagesFrontPage() {
        return $this->db->fetchAll('select * from internship inner join internshiptemplate on internship.InternshipTemplate_ID = internshiptemplate.ID LIMIT 8;');
    }

    public function findSectorsOfTemplate($tempateID) {
        return $this->db->fetchALl('select name from sector inner join internshiptemplate_has_sector on sector.idSector = internshiptemplate_has_sector.Sector_idSector where internshiptemplate_has_sector.InternshipTemplate_ID = ?;', array($tempateID));
    }

}