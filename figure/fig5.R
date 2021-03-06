getwd()
flu <- read.table("flu.txt",sep = "\t",header = T)
mers <- read.table("mers.txt",sep = "\t",header=T)
flu$TPM_mean <- (flu$TPM + flu$TPM2 + flu$TPM3 + flu$TPM4 )/4
cor.test(flu$TPM_mean,flu$e.rate,method = "s")
cor.test(mers$junction3,mers$e_rate,method = "s")
library(ggplot2)
library(grid)
fig5a <- ggplot(flu,aes(log2(TPM_mean),log2(e.rate)))
fig5a <- fig5a + 
  geom_point(color = "#de404c")+
  my_theme2
fig5a
pdf("fig5a.pdf",useDingbats = F,width = 3.6,height = 3.6)  
grid.newpage()
pushViewport(viewport(layout=grid.layout(1,1)))
vplayout <- function(x,y)
  viewport(layout.pos.row = x,layout.pos.col = y)
print(fig5a,vp=vplayout(1,1))
dev.off()

fig5b <- ggplot(mers,aes(log2(junction3),log2(e_rate)))
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

library(meta)
library(dmetar)
meta_data <- read.table("meta_three_ virus.txt",header = T)
m.cor <- metacor(cor, n, data=meta_data, studlab = meta_data$virus, sm = "ZCOR", method.tau = "SJ")
summary(m.cor)

