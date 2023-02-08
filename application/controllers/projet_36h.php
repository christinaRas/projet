<?php
defined('BASEPATH') OR exit('No direct script access allowed');
debug_backtrace();
class projet_36h extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('login');
	}
	public function profil()
	{
		$this->load->view('profil');
	}
	public function log()
	{
		$mail = $this->input->post("email");
		$pass = $this->input->post("password");
		
		$this->load->model('model_login');
		if($this->model_login->checkLogin($mail,$pass))
		{
			$this->session->set_userdata('email', $mail);
			$id = $this->session->userdata('id');
		$this->load->model('model_login');
		$data['valiny'] = $this->model_login->autre($id);
		$this->load->view('profil',$data);
		}else{
			$this->load->view('login');
		}
	}
	public function inscri()
	{
		$email=$this->input->post("email");
		$mdp=$this->input->post("password");
		$nom=$this->input->post("nom");
		
			$this->load->model('model_login');
			$this->model_login->inscri($email,$mdp,$nom);
			$this->load->view('login');
	}
	
	
	public function my_product()
	{
		$id = $this->session->userdata('id');
		$this->load->model('model_login');
		$data['resultat'] = $this->model_login->my_product($id);
		$this->load->view('me',$data);
	}

	public function autre_product()
	{
		$id = $this->session->userdata('id');
		$this->load->model('model_login');
		$data['valiny'] = $this->model_login->autre($id);
		$this->load->view('profil',$data);
	}

	public function publication ()
	{
		$id = $this->session->userdata('id');
		$nom = $this->input->post("nom");
		$descri = $this->input->post("description");
		$prix = $this->input->post("prix");
		$image = $this->input->post("image");
	}
	public function count_user()
	{
		$id = $this->session->userdata('id');
		$this->load->model('model_login');
		$data['count'] = $this->model_login->stat_user();
		$this->load->view('statistique',$data);
		$image = $this->input->post("iamage");
	}
	public function recherche()
	{
		$this->load->view('recherche');

	}
}
