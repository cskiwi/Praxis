<?php

namespace Ikdoeict\Repository;

class CompanyRepository extends \Knp\Repository {

	public function getTableName() {
		return 'Companies';
	}
        
        public function find($id) {
		return $this->db->fetchAssoc('SELECT * FROM companies where idCompany = ?', array($id));
	}
        
        public function findCompanyFacileties($companyID){
            return $this->db->fetchAssoc('SELECT * FROM facileties WHERE companyID = ?', array($companyID));
        }
        
        public function findFacilety($faciletyID) {
            return $this->db->fetchAssoc('SELECT * FROM facileties where idFacilety = ?', array($faciletyID));
        }

}