<?php 
    if(! defined('BASEPATH')) exit('No direct script acces allowed');

    class model_login extends CI_Model 
    {
        // public function find()
        // {
        //     return array('nom'=>'Hariaja','Prenom'=>'Andrianandrasana');
        // }

        // public function listeProduit()
        // {   
        //     $_SESSION['hariaja'] = "bonjour";
        //     $sql = "select * from marque";
        //     $query = $this->db->query($sql);
        //     $result = array();

        //     foreach($query->result_array() as $row)
        //     {
        //         $result[] = $row;
        //     }
        //     return $result;
        // }

        public function checkLogin($mail,$pass)
        {
            $valiny = false;
            $sql = "select * from User where email= '".$mail."' and mdp= '".$pass."' ";
            $query = $this->db->query($sql);
            foreach($query->result_array() as $row)
            {
                if($mail == $row['email']  && $pass == $row['mdp'])
                {
                    $valiny = true;
                }
            }
            return $valiny;
        }
        public function inscri($email,$mdp,$nom)
        {
            $sql="insert into User values(null,'".$email."','".$mdp."','".$nom."',5)";
            $query=$this->db->query($sql);
        }
    }
?>