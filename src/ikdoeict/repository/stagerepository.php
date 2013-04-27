<?php

namespace Ikdoeict\Repository;

class StageRepository extends \Knp\Repository {

	public function getTableName() {
		return 'stages';
	}
        
        public function find($id) {
		return $this->db->fetchAssoc('SELECT stages.* FROM stages INNER JOIN bedrijven on bedrijven.idBedrijven = stages.idBedrijven where stages.idStages = ?;', array($id));
	}
        public function findStages($CompanyID) {
		return $this->db->fetchAll('SELECT * from stages where idBedrijven = ?;', array($CompanyID));
	}


}