

<!--external css-->
<link rel="stylesheet" href="style.css">
<img src="car1.jpg" alt="go die" >
<div class="col-md-2"></div>
            <div class="col-md-8">
            <h1 class="admin_page">TAXI MANAGEMENT SYSTEM</h1>
            
                  <?php
                    require_once('connect.php'); ?>
                    <h3 style="color:pink">Enter the amount to display the dates  have crossed that collection</h3>
                    <form method="post">
                        
                    <label for="usr_ip">AMOUNT : </label>
                    <input type="text" name="usr_ip" id="usr_ip">
                    <button type="submit" name="submit">Submit</button>
                    <?php

                 
                    
                    if (isset($_POST['submit'])) {?>
                        
                        <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>BILL DATE</th>
                        
                        <th>TOTAL</th>
                        <th>NUMBER OF USERS</th>
                        
                        
                      
                    </tr>
                </thead>
                <tbody>
                <?php
                        $ip = $_POST['usr_ip'];
                $query="SELECT	bill_date,usr_id ,SUM(total_amt) AS total,COUNT(usr_id) as no_of_users
                   FROM		billing_detail
                   GROUP BY	bill_date
                   HAVING		SUM(total_amt)>='$ip'";
                    
                    if($result = mysqli_query($conn, $query)){
                        if($result->num_rows > 0){
                            while($row = $result->fetch_object()){
                                
                                
                    ?> 
                        <tr>
                            
                                <td><?php echo $row->bill_date; ?></td> 
                               
                                <td><?php echo $row->total?></td>
                                <td><?php echo $row->no_of_users?></td>
                                
                        </tr>        
                            
                        

                 <?php 
                            }
                            

                    
                
                }
            }
    
                   
                        }
                    
                    
                  ?>
                    </form>
                    
                </tbody>
            </table>
            <div class="col-md-2"></div>
            