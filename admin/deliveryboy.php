<div class="container-fluid" style="margin-top:98px">
    <div class="col-lg-12">
        <div class="row">
            <!-- FORM Panel -->
            <div class="col-md-4">
                <form action="partials/_deliveryboyManage.php" method="post" enctype="multipart/form-data">
                    <div class="card">
                        <div class="card-header" style="background-color: rgb(111 202 203);">
                            Add New Delivery boy
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label class="control-label">Delivery boy Name: </label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Delivery boy phone.no: </label>
                                <input type="number" class="form-control" minlength=10 maxlength=10 name="desc" required>
                            </div> 
                            <div class="form-group">
								<label for="image" class="control-label">Image</label>
								<input type="file" name="image" id="image" accept=".jpg" class="form-control" required style="border:none;">
								<small id="Info" class="form-text text-muted mx-3">Please .jpg file upload.</small>
							</div>  
                        </div>  
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" name="adddeliveryboy" class="btn btn-sm btn-primary col-sm-3 offset-md-4"> Create </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- FORM Panel -->
    
            <!-- Table Panel -->
            <div class="col-md-8 mb-3">
                <div class="card">
                    <div class="card-body">
                    <table class="table table-bordered table-hover mb-0">
                        <thead style="background-color: rgb(111 202 203);">
                        <tr>
                            <th class="text-center" style="width:7%;">Id</th>
                            <th class="text-center">Img</th>
                            <th class="text-center" style="width:58%;">Delivery boy phone number</th>
                            <th class="text-center" style="width:18%;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php 
                            $sql = "SELECT * FROM `deliveryboy`"; 
                            $result = mysqli_query($conn, $sql);
                            while($row =  mysqli_fetch_assoc($result)){
                                $deliveryboyid = $row['deliveryboyid'];
                                $Name = $row['Name'];
                                $deliveryboydesc = $row['deliveryboydesc'];

                                echo '<tr>
                                        <td class="text-center"><b>' .$deliveryboyid. '</b></td>
                                        <td><img src="/OnlinefruitDelivery/img/card-'.$deliveryboyid. '.jpg" alt="image for this deliveryboy" width="150px" height="150px"></td>
                                        <td>
                                            <p>Name : <b>' .$Name. '</b></p>
                                            <p>Description : <b class="trundeliveryboye">' .$deliveryboydesc. '</b></p>
                                        </td>
                                        <td class="text-center">
                                            <div class="row mx-auto" style="width:112px">
                                            <button class="btn btn-sm btn-primary edit_deliveryboy" type="button" data-toggle="modal" data-target="#updatedeliveryboy' .$deliveryboyid. '">Edit</button>
                                            <form action="partials/_deliveryboyManage.php" method="POST">
                                                <button name="removedelivery" class="btn btn-sm btn-danger" style="margin-left:9px;">Delete</button>
                                                <input type="hidden" name="deliveryboyid" value="'.$deliveryboyid. '">
                                            </form></div>
                                        </td>
                                    </tr>';
                            }
                        ?> 
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
            <!-- Table Panel -->
        </div>
    </div>	    
</div>


<?php 
    $deliveryboysql = "SELECT * FROM `deliveryboy`";
    $deliveryboyResult = mysqli_query($conn, $deliveryboysql);
    while($deliveryboyRow = mysqli_fetch_assoc($deliveryboyResult)){
        $deliveryboyid = $deliveryboyRow['deliveryboyid'];
        $Name = $deliveryboyRow['Name'];
        $deliveryboydesc = $deliveryboyRow['deliveryboydesc'];
?>

<!-- Modal -->
<div class="modal fade" id="updatedeliveryboy<?php echo $deliveryboyid; ?>" tabindex="-1" role="dialog" aria-labelledby="updatedeliveryboy<?php echo $deliveryboyid; ?>" aria-hidden="true" style="width: -webkit-fill-available;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: rgb(111 202 203);">
        <h5 class="modal-title" id="updatedeliveryboy<?php echo $deliveryboyid; ?>">deliveryboy Id: <b><?php echo $deliveryboyid; ?></b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="partials/_deliveryboyManage.php" method="post" enctype="multipart/form-data">
		    <div class="text-left my-2 row" style="border-bottom: 2px solid #dee2e6;">
		   		<div class="form-group col-md-8">
					<b><label for="image">Image</label></b>
					<input type="file" name="deliveryboyimage" id="deliveryboyimage" accept=".jpg" class="form-control" required style="border:none;" onchange="document.getElementById('itemPhoto').src = window.URL.createObjectURL(this.files[0])">
					<small id="Info" class="form-text text-muted mx-3">Please .jpg file upload.</small>
					<input type="hidden" id="deliveryboyid" name="deliveryboyid" value="<?php echo $deliveryboyid; ?>">
					<button type="submit" class="btn btn-success my-1" name="updatedeliveryboyPhoto">Update Img</button>
				</div>
				<div class="form-group col-md-4">
					<img src="/OnlinefruitDelivery/img/card-<?php echo $deliveryboyid; ?>.jpg" id="itemPhoto" name="itemPhoto" alt="Delivery boy image" width="100" height="100">
				</div>
			</div>
		</form>
        <form action="partials/_deliveryboyManage.php" method="post">
            <div class="text-left my-2">
                <b><label for="name">Name</label></b>
                <input class="form-control" id="name" name="name" value="<?php echo $Name; ?>" type="text" required>
            </div>
            <div class="text-left my-2">
                <b><label for="desc">Phone number</label></b>
                <textarea class="form-control" id="desc" name="desc" rows="2" required minlength="6"><?php echo $deliveryboydesc; ?></textarea>
            </div>
            <input type="hidden" id="deliveryboyid" name="deliveryboyid" value="<?php echo $deliveryboyid; ?>">
            <button type="submit" class="btn btn-success" name="updatedeliveryboy">Update</button>
        </form>
      </div>
    </div>
  </div>
</div>

<?php
    }
?>