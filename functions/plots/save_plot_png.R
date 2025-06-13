# save_plot_png.R
# A function to save any plot as an svg

save_plot_png <- function(figure, filename, size_cm, res=300){
  # size_cm: can either be a (width, height) vector or single integer which will generate a square
  
  # Defaults one number size input to make a square file
  if(length(size_cm) < 2) size_cm[2] <- size_cm[1]
  
  
  png(
    filename,
    width = size_cm[1], 
    height  = size_cm[2],
    units = "cm",
    res = res
  )
  print(figure)
  dev.off()
}