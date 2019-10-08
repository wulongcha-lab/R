###变量的相关系数阵和方差协方差阵区别
library(MASS)
sigma<-matrix(c(100,3,3,2),2,2)
sigma
x=mvrnorm(n=1000,rep(0,2),sigma)
eigen(cov(x))
eigen(cor(x))
#一般情况下推荐使用相关系数阵，当单位都一致的时候相关系数阵和方差协方差都行

#主成分分析方差协方差矩阵理论
X=read.table("clipboard",header=T)
cor(X)
sigma1=cor(X)#方差协方差矩阵
U=eigen(sigma1)$vectors#谱分解U矩阵
Lambda=diag(eigen(sigma1)$values)
d7.2=read.table()
n=nrow(X)
p=ncol(X)
ln=rep(1,n)
xbar=ln%*%t(1n)
In=diag(n)
Jn=ln%*%t(1n)
xS=t(as.matrix(X))%*%(In-Jn/n)%*%as.matrix(X)/(n-1)
Z=(as.matrix(X)-matrix(rep(xbar,n),nrow = n,ncol = p,
                       byrow = T))%*%diag(1/sqrt(diag(xS)))
Y=as.matrix(Z)%*%U #得到主成分Y

##与princomp函数对比
PCA=princomp(X,cor = T)#主成分分析
PCA
PCA$loadings
U
PCA$scores#主成分得分与直接计算中的Y一样
Y
scale(X)
Z #问题出在Z不同
PCA$center #与直接运算中的xbar是一样的
xbar
PCA$scale #得到x的标准差与直接计算中的x标准差不一样
sqrt(diag(xS))
scale(X,PCA$center,PCA$scale)%*%U
rsd=(apply(X,2,var)*(n-1)/n)^0.5#这里n-1/n表示用的是总体标准差
rsd#由此得出函数是用总体体标准差，一个是样本标准差
#试一试换成总体标准差计算

###验证princomp和cov(X)结果区别并解释
#用cov()得到的主成分分析结果
sigma=cov(X)#方差协方差矩阵
U=eigen(sigma1)$vectors#谱分解U矩阵
Lambda=diag(eigen(sigma1)$values)
Y=as.matrix(Z)%*%U #得到主成分Y
PCAv=princomp(X,cor = F) #主成分分析
PCAv
PCAv[1]
Lambda
PCAv$loadings
U#特征向量U是相同的
PCAv$scores #主成分得分
Y

sqrt(Lambda^2*(n-1)/n)
scale(X,center = T,scale = F)%*%U

##变量相关性的一致产生的问题
Sigma2<-matrix(c(1,0.3,0.3,0.3,1,0.3,0.3,0.3,1),3,3)
Sigma2
x=mvrnorm(n=1000,rep(0,3),Sigma2)
eigen(cor(x))#主成分1=1+(p-1)rho,u1=1/sqrt(p)
pairs(x)

Sigma2<-matrix(c(1,0.9,0.9,0.9,1,0.9,0.9,0.9,1),3,3)
Sigma2
x=mvrnorm(n=1000,rep(0,3),Sigma2)
eigen(cor(x))#主成分1=1+(p-1)rho,u1=1/sqrt(p)
pairs(x)
#结论：相关且相关性高的变量适合使用主成分分析

##变量不相关产生的问题
Sigma3<-matrix(c(1,0,0,0,1,0,0,0,1),3,3)
Sigma3
x=mvrnorm(n=1000,rep(0,3),Sigma3)
eigen(cor(x))#主成分1=1+(p-1)rho,u1=1/sqrt(p)
pairs(x)#绘制两两之间的散点图