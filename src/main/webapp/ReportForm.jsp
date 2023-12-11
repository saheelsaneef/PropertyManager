<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="ReportForm.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Form</title>

</head>
<body>

<form class="form bg-info rounded-3" action="ReportInsert" method="post">
	
	<div class = "d-flex flex-coloumn mt-5">
	
		<div class="image rounded">
			<img src="GettyImages-84227628-2000-a7e7b3ceeb6e42f9b8395dd0f9c5836c.jpg" alt ="Side image">
		</div>
		
		<div class ="fill">
		
			<h4 class="text-success text-center text-dark pt-5">Fill Carefully</h4>
					
  			<div class="col-md-5">
    			<label for="income" class="form-label text-dark  mx-4 mt-3">Income</label>
    			<input type="text" class="form-control mx-4"  id="income" name="income"required>
    			<div class="invalid-feedback mx-4" id="income-error"></div>
  			</div>
    
			<div class="form-group input-group-sm mx-4 mt-4 col-sm-6">
        		<label for="date" class="form-label text-dark">Date</label>
        		<input type="date" class="form-control" id="inputDate" name="date" required>
        		<div class="invalid-feedback mx-4" id="date-error"></div>
        	</div>
			
			<p class ="text mx-4 mt-4">Select status</p>
    		<select name="status" class="form-select form-select-sm mx-4  col-sm-5" aria-label=".form-select-sm example" required>
    			
        		<option selected disabled></option>
        		<option value="Profit">Profit</option>
        		<option value="Lost">Lost</option>
    		</select>
			
			<div class="form-group mt-5 mx-4"> 
        		<button class="btn btn-dark" name="submit" type="submit">Submit</button>
    		</div>
    
    	</div>
	
	</div>
	
</form>


<script>
document.addEventListener("DOMContentLoaded", function() {
    var incomeInput = document.getElementById("income");
    var form = document.querySelector("form");

    form.addEventListener("submit", function(event) {
        if (!isValidIncome(incomeInput.value)) {
            event.preventDefault();
            alert("Income must be a in Integer");
        }
    });

    function isValidIncome(input) {
        
        var numberPattern = /^-?\d*\.?\d+$/;
        return numberPattern.test(input);
    }
});

document.addEventListener("DOMContentLoaded", function() {
    var dateInput = document.getElementById("inputDate");
    var dateError = document.getElementById("date-error");
    var statusSelect = document.querySelector("select");
    var form = document.getElementById("income-form");

    form.addEventListener("submit", function(event) {
        if (!isValidDate(dateInput.value)) {
            event.preventDefault();
            dateInput.classList.add("is-invalid");
            dateError.textContent = "Please enter a valid date.";
        } else {
            dateInput.classList.remove("is-invalid");
            dateError.textContent = "";
        }

        if (statusSelect.value === "") {
            event.preventDefault();
            statusSelect.classList.add("is-invalid");
        } else {
            statusSelect.classList.remove("is-invalid");
        }
    });

    function isValidDate(dateString) {
        var regex = /^\d{4}-\d{2}-\d{2}$/;
        return regex.test(dateString);
    }
});

</script>


</body>
</html>