
# defining the compute_bmi function
compute_bmi <- function(height_in_m, weight_in_kg, print_text=FALSE){
  
  # bunch of tests to make sure the input provided by the user
  # makes sense
  if (height_in_m > 3){
    stop("Height must be entered in m.")
  }
  
  # code that my function does
  bmi <- weight_in_kg/(height_in_m^2)
  # return something to the user
  # replaced print() with cat()
  
  
  bmi_category <- ""
  
  # Option 1: nested if-else statements
  if (bmi < 18.5){
    bmi_category <- "Underweight"
  } else if (bmi < 25){
    bmi_category <- "Healthy" 
  } else if (bmi < 30){
    bmi_category <- "Overweight" 
  } else {
    bmi_category <- "Obesity" 
  }  
  
    # Underweight	Below 18.5
    # Healthy	18.5 – 24.9
    # Overweight	25.0 – 29.9
    # Obesity	30.0 or above
    
    
  # # Option 2: non-nested if-else statements
  # if (bmi < 18.5){
  #     bmi_category <- "Underweight"
  # } 
  # if ((bmi >= 18.5) & (bmi < 25)){
  #   bmi_category <- "Healthy"
  # }    
  # if ((bmi >= 25) & (bmi < 30)){
  #   bmi_category <- "Overweight"
  # }    
  # if (bmi >= 30){
  #   bmi_category <- "Obesity"
  # }    
  
  
  
  
  
  # Underweight	Below 18.5
  # Healthy	18.5 – 24.9
  # Overweight	25.0 – 29.9
  # Obesity	30.0 or above
  
  
  # # just for debugging
  # print(bmi)
  # print(bmi_category)
  # 
  
if (print_text){
  cat(
    paste0(
      "Your height is ", height_in_m, "m and your weight is ", weight_in_kg,
      "kg.\nYour BMI is ", round(bmi, 1), ".\n", 
      "Your BMI category is ", bmi_category, '.\n\n'
    )
  )
  
}
  
  return(bmi)
}

## testing my function with specific inputs
# compute_bmi(height_in_m = 1.80, weight_in_kg = 50)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 60)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 70)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 80)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 90)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 100)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 110)
# compute_bmi(height_in_m = 1.80, weight_in_kg = 150)

compute_bmi(height_in_m = 1.80, weight_in_kg = 150, print_text = TRUE)


