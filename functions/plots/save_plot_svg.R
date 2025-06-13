# save_plot_svg.R
# A function to save any plot as an svg

save_plot_svg <- function(figure, filename, size_cm, scaling=1){
  # size_cm: can either be a (width, height) vector or single integer which will generate a square
  
  # Defaults one number size input to make a square file
  if(length(size_cm) < 2) size_cm[2] <- size_cm[1]
  
  # Converts the size to inches from cm
  size_inches <- size_cm/2.54
  
  svglite::svglite(
    filename,
    width = size_inches[1], 
    height  = size_inches[2], 
    scaling = scaling
  )
  print(figure)
  dev.off()
}