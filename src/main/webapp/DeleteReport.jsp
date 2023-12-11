<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="DeleteReport.css">
<title>Delete Report</title>
</head>
<body>

<form class="form rounded bg-secondary" id="income-form" action="DeleteReport" method="post">
	
	<h4 class="text-success text-center text-white pt-5">Delete Carefully</h4>
			
			<div class="col-md-5">
    			<label for="id" class="form-label text-white  mx-4 mt-4">ID</label>
    			<input type="text" class="form-control mx-4"  id = "id" name="id" required>
    			<div class="invalid-feedback mx-4" id="id-error"></div>
  			</div>    
  			
  			<div class="form-group mt-5 mx-4"> 
        		<button class="btn btn-danger" name="delete" type="submit">Delete</button>
    		</div>
</form>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var idInput = document.getElementById("id");
            var idError = document.getElementById("id-error");
            var form = document.getElementById("income-form");

            form.addEventListener("submit", function(event) {
                if (!isValidInteger(idInput.value)) {
                    event.preventDefault();
                    idInput.classList.add("is-invalid");
                    idError.textContent = "ID must be a valid integer.";
                } else {
                    idInput.classList.remove("is-invalid");
                    idError.textContent = "";
                }
            });

            function isValidInteger(value) {
                
                return /^\d+$/.test(value);
            }
        });
    </script>


</body>
</html>