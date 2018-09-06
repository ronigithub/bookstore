<div class="row">
	<div class="col-md-12">
		<?php echo form_open_multipart('Books/post_book'); ?>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<lable>Book Title</lable>
					<?php 
						echo form_input(array(
							'name' => 'book_title',
							'class' => 'form-control'
						));
					 ?>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<lable>ISBN Number</lable>
					<?php 
						echo form_input(array(
							'name' => 'book_isbn',
							'class' => 'form-control'
						));
					 ?>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<lable>Year of publications</lable>
					<?php 
						echo form_input(array(
							'name' => 'book_yop',
							'class' => 'form-control'
						));
					 ?>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<lable>Book Genre</lable>
					<select name="book_genreid" class="form-control select2">
						<option>Select a Genre</option>
						<?php echo $genres; ?>
					</select>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<lable>Publisher</lable>
					<select name="book_publisherid" class="form-control select2" required="required">
						<option>Select a Publisher</option>
						<?php echo $publications; ?>
					</select>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<lable>Authors</lable>
					<select name="authors[]" class="form-control select2" multiple>
						<?php echo $authors; ?>
					</select>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<lable>Book Images</lable>
					<input type="file" name="book_images" multiple>
				</div>
			</div>
			<div class="col-md-12">
				<button class="btn btn-primary btn-large">Save Details</button>
			</div>
		</div>
		<?php echo form_close(); ?>
	</div>
</div>