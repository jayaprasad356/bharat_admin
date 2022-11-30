<?php
include_once('includes/functions.php');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;
?>
<?php

if (isset($_GET['id'])) {
    $ID = $db->escapeString($_GET['id']);
} else {
    // $ID = "";
    return false;
    exit(0);
}
if (isset($_POST['btnEdit'])) {

	    $category = $db->escapeString(($_POST['category']));
	    $product_name = $db->escapeString($_POST['product_name']);
		$measurement = $db->escapeString($_POST['measurement']);
        $unit = $db->escapeString($_POST['unit']);
        $brand = $db->escapeString($_POST['brand']);
		$price = $db->escapeString($_POST['price']);
		$mrp = $db->escapeString($_POST['mrp']);
		$description = $db->escapeString($_POST['description']);
		$error = array();

		if (empty($category)) {
            $error['category'] = " <span class='label label-danger'>Required!</span>";
        }
        if (empty($product_name)) {
            $error['product_name'] = " <span class='label label-danger'>Required!</span>";
        }
		if (empty($measurement)) {
            $error['measurement'] = " <span class='label label-danger'>Required!</span>";
        }
        if (empty($unit)) {
            $error['unit'] = " <span class='label label-danger'>Required!</span>";
        }
        if (empty($brand)) {
            $error['brand'] = " <span class='label label-danger'>Required!</span>";
        }
		if (empty($price)) {
            $error['price'] = " <span class='label label-danger'>Required!</span>";
        }
        if (empty($description)) {
            $error['description'] = " <span class='label label-danger'>Required!</span>";
        }

		

		if ( !empty($category) && !empty($product_name) && !empty($measurement) && !empty($unit) && !empty($brand) && !empty($price) && !empty($mrp) && !empty($description)) 
		{
			if ($_FILES['image']['size'] != 0 && $_FILES['image']['error'] == 0 && !empty($_FILES['image'])) {
				//image isn't empty and update the image
				$old_image = $db->escapeString($_POST['old_image']);
				$extension = pathinfo($_FILES["image"]["name"])['extension'];
		
				$result = $fn->validate_image($_FILES["image"]);
				$target_path = 'upload/products/';
				
				$filename = microtime(true) . '.' . strtolower($extension);
				$full_path = $target_path . "" . $filename;
				if (!move_uploaded_file($_FILES["image"]["tmp_name"], $full_path)) {
					echo '<p class="alert alert-danger">Can not upload image.</p>';
					return false;
					exit();
				}
				if (!empty($old_image)) {
					unlink($old_image);
				}
				$upload_image = 'upload/products/' . $filename;
				$sql = "UPDATE products SET `image`='" . $upload_image . "' WHERE `id`=" . $ID;
				$db->sql($sql);
			}
			
             $sql_query = "UPDATE products SET category_id='$category',product_name='$product_name',measurement='$measurement',unit='$unit',brand='$brand',price='$price',mrp='$mrp',description='$description' WHERE id =  $ID";
			 $db->sql($sql_query);
			 $res = $db->getResult();
             $update_result = $db->getResult();
			if (!empty($update_result)) {
				$update_result = 0;
			} else {
				$update_result = 1;
			}

			// check update result
			if ($update_result == 1) {
			    $error['update_product'] = " <section class='content-header'><span class='label label-success'>Product updated Successfully</span></section>";
			} else {
				$error['update_product'] = " <span class='label label-danger'>Failed to update</span>";
			}
		}
	} 


// create array variable to store previous data
$data = array();

$sql_query = "SELECT * FROM products WHERE id =" . $ID;
$db->sql($sql_query);
$res = $db->getResult();

if (isset($_POST['btnCancel'])) { ?>
	<script>
		window.location.href = "products.php";
	</script>
<?php } ?>
<section class="content-header">
	<h1>
		Edit Product<small><a href='products.php'><i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Products</a></small></h1>
	<small><?php echo isset($error['update_product']) ? $error['update_product'] : ''; ?></small>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-home"></i> Home</a></li>
	</ol>
</section>
<section class="content">
	<!-- Main row -->

	<div class="row">
		<div class="col-md-12">
		
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					
				</div><!-- /.box-header -->
				<!-- form start -->
				<form id="edit_product_form" method="post" enctype="multipart/form-data">
					<div class="box-body">
					    <input type="hidden" id="old_image" name="old_image"  value="<?= $res[0]['image']; ?>">
						   <div class="row">
							    <div class="form-group">
								    <div class="col-md-4">
										<label for="exampleInputEmail1">Product Name</label><i class="text-danger asterik">*</i><?php echo isset($error['product_name']) ? $error['product_name'] : ''; ?>
										<input type="text" class="form-control" name="product_name" value="<?php echo $res[0]['product_name']; ?>">
									 </div>
									<div class='col-md-4'>
									          <label for="exampleInputEmail1">Category</label> <i class="text-danger asterik">*</i>
												<select id='category' name="category" class='form-control' required>
                                                <option value="none">Select</option>
                                                            <?php
                                                            $sql = "SELECT * FROM `categories`";
                                                            $db->sql($sql);

                                                            $result = $db->getResult();
                                                            foreach ($result as $value) {
                                                            ?>
															 <option value='<?= $value['id'] ?>' <?= $value['id']==$res[0]['category_id'] ? 'selected="selected"' : '';?>><?= $value['name'] ?></option>
                                                               
                                                            <?php } ?>
                                                </select>
									</div>
									<div class="col-md-4">
										<label for="exampleInputEmail1">Brand</label><i class="text-danger asterik">*</i><?php echo isset($error['brand']) ? $error['brand'] : ''; ?>
										<select id="brand" name="brand" class="form-control">
									
											<option value="none">Select</option>
                                                            <?php
                                                            $sql = "SELECT * FROM `brands`";
                                                            $db->sql($sql);

                                                            $result = $db->getResult();
                                                            foreach ($result as $value) {
                                                            ?>
															 <option value='<?= $value['brand'] ?>' <?= $value['brand']==$res[0]['brand'] ? 'selected="selected"' : '';?>><?= $value['brand'] ?></option>
                                                               
                                                            <?php } ?>
										</select>
									</div>
								</div>
						   </div>
						   <br>
						   <div class="row">
								<div class="form-group">
								    <div class="col-md-4">
										<label for="exampleInputEmail1">Measurement</label><i class="text-danger asterik">*</i><?php echo isset($error['measurement']) ? $error['measurement'] : ''; ?>
										<input type="text" class="form-control" name="measurement" value="<?php echo $res[0]['measurement']; ?>">
									 </div>
									 <div class="col-md-4">
										<label for="exampleInputEmail1">Unit</label><i class="text-danger asterik">*</i><?php echo isset($error['unit']) ? $error['unit'] : ''; ?>
										<select id="unit" name="unit" class="form-control">
											<option value="none">-- Select --</option>
											<option value="kg"<?=$res[0]['unit'] == 'kg' ? ' selected="selected"' : '';?>>kg</option>
											<option value="gm"<?=$res[0]['unit'] == 'gm' ? ' selected="selected"' : '';?> >gm</option>
											<option value="l"<?=$res[0]['unit'] == 'l' ? ' selected="selected"' : '';?> >l</option>
											<option value="ml"<?=$res[0]['unit'] == 'ml' ? ' selected="selected"' : '';?> >ml</option>
											<option value="pcs"<?=$res[0]['unit'] == 'pcs' ? ' selected="selected"' : '';?> >pcs</option>

										</select>
									 </div>
									 <div class="col-md-4">
										<label for="exampleInputEmail1">Price</label><i class="text-danger asterik">*</i><?php echo isset($error['price']) ? $error['price'] : ''; ?>
										<input type="text" class="form-control" name="price" value="<?php echo $res[0]['price']; ?>">
									 </div>
									
								</div>
						   </div>
						   <br>
						   <div class="row">
							    <div class="form-group">
							     	<div class="col-md-4">
										<label for="exampleInputEmail1">Max.Retail.Price(MRP)</label><i class="text-danger asterik">*</i><?php echo isset($error['mrp']) ? $error['mrp'] : ''; ?>
										<input type="text" class="form-control" name="mrp" value="<?php echo $res[0]['mrp']; ?>">
									 </div>
									 <div class="col-md-6">
										<label for="exampleInputEmail1">Description</label><i class="text-danger asterik">*</i><?php echo isset($error['description']) ? $error['description'] : ''; ?>
										<textarea type="text" rows="3" class="form-control" name="description"><?php echo $res[0]['description']; ?></textarea>
									 </div>
								</div>
						   </div>
						   <br>
						   <div class="row">
								<div class="form-group">
										<div class="col-md-4">
											<label for="exampleInputFile">Image</label><i class="text-danger asterik">*</i>
											
											<input type="file" accept="image/png,  image/jpeg" onchange="readURL(this);"  name="image" id="image">
											<p class="help-block"><img id="blah" src="<?php echo $res[0]['image']; ?>" style="height:100px;max-width:100%" /></p>
										</div>
								</div>
						   </div>
						   
					
					</div><!-- /.box-body -->
                       
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" name="btnEdit">Update</button>
					
					</div>
				</form>
			</div><!-- /.box -->
		</div>
	</div>
</section>

<div class="separator"> </div>
<script>
    function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
</script>
<?php $db->disconnect(); ?>
