flu <- read.table("flu.txt",sep = "\t",header = T)
flu$TPM_mean <- (flu$TPM + flu$TPM2 + flu$TPM3 + flu$TPM4 )/4
cor.test(flu$TPM_mean,flu$e.rate,method = "s")
library(ggplot2)
library(grid)
fig5b <- ggplot(flu,aes(log2(TPM_mean),log2(e.rate)))
fig5b <- fig5b + 
  geom_point(color = "#de404c")+
  my_theme2
fig5b
pdf("fig5b.pdf",useDingbats = F,width = 3.6,height = 3.6)  
grid.newpage()
pushViewport(viewport(layout=grid.layout(1,1)))
vplayout <- function(x,y)
  viewport(layout.pos.row = x,layout.pos.col = y)
print(fig5b,vp=vplayout(1,1))
dev.off()

