<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

 <link rel="stylesheet" href="http://www.khmeracademy.org/resources/assets/css/bootstrap.min.css"/>
 
</head>
<body>
<h1>Home</h1>
<div ng-controller="firstController">
	<h1 ng-click="show()">{{firstname}}</h1>
	
	<ul>
		<li ng-repeat="u in users">{{u.EMAIl}}</li>
	</ul>
	
	<div id="pagination" class="pull-right">
												
	</div>
						 
						 
</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
 <script src="jquery.bootpag.min.js"></script>
 <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
 <script type="text/javascript">
 
 var app = angular.module('myApp', []);
 app.controller('firstController', function($scope, $http) {
     $scope.firstname = "John";
     $scope.lastname = "Doe";
     check = true;
     currentPage = 1;
     
     
     
     $scope.showData = function(currentPage){
    	 
    	 $http({url: 'http://localhost:8080/rest/user?limit=3&page='+currentPage,
    	    	method: 'GET',
         }).then(function(response){
        	 console.log(response.data);
        	 $scope.users = response.data.REST_DATA;
        	 if(check){
					setPagination(response.data.PAGINATION.TOTAL_PAGES,currentPage);
					check=false;
		     }
         }, function(){
        	 alert('Error');
         }); 
         
        
     }
    	
     setPagination = function(totalPage, currentPage){
	    	$('#pagination').bootpag({
		        total: totalPage,
		        page: currentPage,
		        maxVisible: 10,
		        leaps: true,
		        firstLastUse: true,
		        first: 'First',
		        last: 'Last',
		        wrapClass: 'pagination',
		        activeClass: 'active',
		        disabledClass: 'disabled',
		        nextClass: 'next',
		        prevClass: 'prev',
		        lastClass: 'last',
		        firstClass: 'first'
		    }).on("page", function(event, currentPage){
		    	check = false;
		    	getCurrentPage = currentPage;
		    	$scope.showData(currentPage);
		    }); 	
		};
		
	$scope.showData(currentPage);
	
	
	
	
	/*  $scope.show = function(){
	 $http
	.get("http://localhost:8080/rest/user")
	.then(function(response) {
		console.log(response.data);
	 	 });
} */
     
    
 });
 
 </script>
 
 
 
 <!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
        
        $(function() {
        	
       		user = {}; 	
        	
       		user.get = function(){
       			$.ajax({ 
    			    url: "http://localhost:9999/api/user", 
    			    type: 'GET', 
    			    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                        xhr.setRequestHeader("Authorization" , "Basic ZGV2OiFAI2FwaQ==");
    			    },
    			    success: function(data) { 
    					console.log(data);
    				  
    					
    			    },
    			    error:function(data,status,er) { 
    			        console.log("error: "+data+" status: "+status+" er:"+er);
    			    }
    			});
       		};
        	
        	user.addUser = function(){
        		frmData = { 
   				 	  USERNAME :  "tola",
   				  	  PASSWORD :  "123",
   				  	  EMAIL : "tolapheng99999@gmail.com",
   				  	  ROLE_ID : 2
   		  		};
        		$.ajax({ 
    			    url: "http://localhost:8080/rest/user", 
    			    type: 'POST', 
    			    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
//                         xhr.setRequestHeader("Authorization" , "Basic ZGV2OiFAI2FwaQ==");
                    },
                    data: JSON.stringify(frmData), 
    			    success: function(data) { 
    					console.log(data);
    				  
    					
    			    },
    			    error:function(data,status,er) { 
    			        console.log("error: "+data+" status: "+status+" er:"+er);
    			    }
    			});
        	}
        
        	
        	user.get();
        	user.addUser();
        	
        });
        </script> -->
        
 </body>
</html>