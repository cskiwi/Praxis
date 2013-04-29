<?php

namespace Ikdoeict\Repository;

class InternshipRepository extends \Knp\Repository {

	public function getTableName() {
		return 'internship';
	}
        
        public function find($id) {
		return $this->db->fetchAssoc('SELECT stages.* FROM stages INNER JOIN bedrijven on bedrijven.idBedrijven = stages.idBedrijven where stages.idStages = ?;', array($id));
	}
        public function findStages($CompanyID) {
		return $this->db->fetchAll('select * from intership inner join internshiptemplate on intership.InternshipTemplate_ID = internshiptemplate.ID where Facileties_ID = ?;', array($CompanyID));
	}


}