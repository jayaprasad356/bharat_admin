
<section class="content-header">
    <h1>Users /<small><a href="home.php"><i class="fa fa-home"></i> Home</a></small></h1>
  
</section>

    <!-- Main content -->
    <section class="content">
        <!-- Main row -->
        <div class="row">
            <!-- Left col -->
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                           <div class="form-group col-md-3">
                                <h4 class="box-title">Filter by Registered Date </h4><br>
                                <input type="date" class="form-control" name="date" id="date" />
                            </div>
                            <div class="form-group col-md-4">
                                       <h4 class="box-title">Filter by Month </h4>
                                        <select id='month' name="month" class='form-control'>
                                            <option value="">select</option>
                                                <?php
                                                $sql = "SELECT id,month FROM `months`";
                                                $db->sql($sql);
                                                $result = $db->getResult();
                                                $month = date('m');
                                                foreach ($result as $value) {
                                                ?>
                                                    <option value='<?= $value['id'] ?>' <?=$month == $value['id'] ? ' selected="selected"' : '';?>><?= $value['month'] ?></option>
                                            <?php } ?>
                                        </select>
                            </div>
                            <div class="form-group col-md-3">
                                <h4 class="box-title">Filter by Registered Year </h4><br>
                                <select id='year' name="year" class='form-control'>
                                    <option value="">select</option>
                                        <?php
                                        $sql = "SELECT id,year FROM `years`";
                                        $db->sql($sql);
                                        $result = $db->getResult();
                                        $year = date('Y');
                                        foreach ($result as $value) {
                                        ?>
                                            <option value='<?= $value['year'] ?>' <?=$year == $value['year'] ? ' selected="selected"' : '';?>><?= $value['year'] ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                    </div>
                    
                    <div  class="box-body table-responsive">
                    <table id='users_table' class="table table-hover" data-toggle="table" data-url="api-firebase/get-bootstrap-table-data.php?table=users" data-page-list="[5, 10, 20, 50, 100, 200]" data-show-refresh="true" data-show-columns="true" data-side-pagination="server" data-pagination="true" data-search="true" data-trim-on-search="false" data-filter-control="true" data-query-params="queryParams" data-sort-name="id" data-sort-order="desc" data-show-export="false" data-export-types='["txt","excel"]' data-export-options='{
                            "fileName": "students-list-<?= date('Y-m-d') ?>",
                            "ignoreColumn": ["operate"] 
                        }'>
                            <thead>
                                <tr>
                                    
                                    <th  data-field="id" data-sortable="true">ID</th>
                                    <th data-field="name" data-sortable="true">Name</th>
                                    <th  data-field="mobile" data-sortable="true">Mobile Number</th>
                                    <th  data-field="password" data-sortable="true"> Password</th>
                                    <th  data-field="aadhaar_num" data-sortable="true"> Aadhaar Number</th>
                                    <th  data-field="occupation" data-sortable="true">Occupation</th>
                                    <th  data-field="gender" data-sortable="true"> Gender</th>
                                    <th  data-field="address" data-sortable="true">Address</th>
                                    <th  data-field="village" data-sortable="true">Village</th>
                                    <th  data-field="pincode" data-sortable="true">Pincode</th>
                                    <th  data-field="district" data-sortable="true">District</th>
                                    <th  data-field="image">Aadhaar</th>
                                    <th  data-field="registered_date" data-sortable="true">Registered Date</th>
                                    <th  data-field="balance" data-sortable="true">Balance</th>
                                    <th  data-field="total_orders" data-sortable="true">Total Orders</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <div class="separator"> </div>
        </div>
    </section>

<script>
    $('#date').on('change', function() {
        id = $('#date').val();
        $('#users_table').bootstrapTable('refresh');
    });
    $('#month').on('change', function() {
        id = $('#month').val();
        $('#users_table').bootstrapTable('refresh');
    });
    $('#year').on('change', function() {
        id = $('#year').val();
        $('#users_table').bootstrapTable('refresh');
    });

    function queryParams(p) {
        return {
            "date": $('#date').val(),
            "month": $('#month').val(),
            "year": $('#year').val(),
            limit: p.limit,
            sort: p.sort,
            order: p.order,
            offset: p.offset,
            search: p.search
        };
    }
</script>