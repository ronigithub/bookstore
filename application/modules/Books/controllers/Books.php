<?php
defined("BASEPATH") OR exit("No direct script allowed");

/**
 * Books Module
 */
class Books extends MY_Controller
{
	
	function __construct()
	{
		parent::__construct();
	}

	function display_books() {
		$data['page_header'] = "All Books";
		$data['description'] = "Displays all books";
		$data['content_view'] = "Books/display_books_v";
		$this->template->call_admin_template($data);
	}

	function addBook(){
		$data['authors'] = $this->create_authors_select();
		$data['genres'] = $this->create_genres_select();
		$data['publishers'] = $this->create_publishers_select();
		$data['page_header'] = "Add Book";
		$data['description'] = "Add new book to system";
		$data['content_view'] = "Books/add_book_v";
		$this->template->call_admin_template($data);
	}

	function create_authors_select(){
		$this->load->model('Authors/M_Authors');
		$authors = $this->M_Authors->get_active_authors();
		$options = "";
		if(count($authors) > 0){
			foreach ($authors as $key => $value) {
				$options .= "<option value='{$value->author_id}'>{$value->author_firstname} {$value->author_lastname}</option>";
			}
		}
		return $options;
	}

	function create_genres_select(){
		$this->load->model('Genres/M_Genres');
		$genres = $this->M_Genres->get_active_genres();
		$options = "";
		if(count($genres) > 0) {
			foreach ($genres as $key => $value) {
				$options .= "<option value='{$value->book_genreid}'>{$value->book_genre}</option>";
			}
		}
		return $options;
	}

	function create_publishers_select(){
		$this->load->model('Publishers/M_Publishers');
		$publishers = $this->M_Publishers->get_active_publishers();
		$options = "";
		if(count($publishers) > 0) {
			foreach ($publishers as $key => $value) {
				$options .= "<option value='{$value->book_genreid}'>{$value->book_genre}</option>";
			}
		}
		return $options;
	}

	function post_book(){

	}
}