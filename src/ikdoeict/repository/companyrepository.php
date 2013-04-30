<?php

namespace Ikdoeict\Repository;

class CompanyRepository extends \Knp\Repository {

    public function getTableName() {
        return 'Companies';
    }

    public function find($id) {
        return $this->db->fetchAssoc('SELECT * FROM companies where idCompany = ?;', array($id));
    }

    public function findCompanyFacileties($companyID) {
        return $this->db->fetchAll('SELECT * FROM facilities WHERE idCompany = ?;', array($companyID));
    }

    public function findFacilety($faciletyID) {
        return $this->db->fetchAssoc('SELECT * FROM facilities where idFacilety = ?;', array($faciletyID));
    }

    public function findLogin($email, $password) {
        return $this->db->fetchAssoc('SELECT Login, Pass FROM Companies WHERE Login = ? AND Pass = ?;', array($email, $password));
    }

    public function addFacility($data) {
        $id = $this->db->fetchAssoc('SELECT idCompany FROM companies where login = ?;', array($data['0']));

        array_push($data, $id['idCompany']);               

        return $this->db->insert('INSERT INTO `facilities`(`idCompany`, `NameFacility`, `Street`, `House nr`, `City`, `Coutry`, `Phone`, `Fax`, `Email`, `BannerURL`) VALUES (?,?,?,?,?,?,?,?,?,?);', array(intval($data['1']), $data['Name'], $data['Street'], $data['HouseNr'], $data['City'], $data['Country'], $data['Phone'], $data['Fax'], "", ""));
    }
    
    
    

}