<?php 
    if(! defined('BASEPATH')) exit('No direct script acces allowed');
    debug_backtrace();
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
                    $this->load->library('session');
                    $this->session->set_userdata('id', $row['idUser']);
                    $this->session->set_userdata('admin', $row['identification']);
                    $this->session->set_userdata('nom', $row['nom']);
                    $this->session->set_userdata('pdp', $row['photo']);
                    $this->session->set_userdata('admin', $row['identification']);


                }
            }
            return $valiny;
        }
        public function inscri($email,$mdp,$nom)
        {
            $sql="insert into User values(null,'".$email."','".$mdp."','".$nom."',5)";
            $query=$this->db->query($sql);
        }

        public function autre($id)
        {
            $sql = "select * from Objet where idUser !='".$id."'";
            $produitautre  = $this->db->query($sql);
            return $produitautre->result();
        }

        public function my_product($id)
        {
            $sql = "select * from Objet where idUser ='".$id."'";
            $produit  = $this->db->query($sql);
            return $produit->result();
        }
        public function publication($id,$nom,$desc,$prix,$photo,$categorie)
            {
                $sql = "insert into objet values(null,'".$id."','".$nom."','".$desc."','".$prix."','".$photo."','".$categorie."')";
                $this->db->query($sql);
            }
        public function stat_user()
        {
            $sql=" select count(idUser) as user from user where identification!=1";
            $stat  = $this->db->query($sql);
            return $stat->result();
        }
        public function stat_echange()
        {
            $sql=" select count(user)as n from nombre;";
            $stat  = $this->db->query($sql);
            return $stat->result();
        }
         
    }
?>