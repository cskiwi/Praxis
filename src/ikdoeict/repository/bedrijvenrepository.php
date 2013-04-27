<?php

namespace Ikdoeict\Repository;

class BedrijvenRepository extends \Knp\Repository {

	public function getTableName() {
		return 'bedrijven';
	}
        
        public function find($id) {
		return $this->db->fetchAssoc('SELECT * FROM bedrijven where idBedrijven = ?', array($id));
	}

}