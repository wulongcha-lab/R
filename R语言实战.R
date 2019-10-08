#引言例子
age<-c(1,3,5,2,11,9,3,9,12,3)
weight<-c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
mean(weight)
sd(weight)
cor(age,weight)
plot(age,weight)
demo(graphics)

#创建一个矩阵
y<-matrix(1:20,nrow = 5,ncol = 4)
y
cells<-c(2,4,6,8)
cells
rnames<-c("R1","R2")
cnames<-c("A1","A2")
mymatrix<-matrix(cells,nrow = 2,ncol = 2,byrow = TRUE,
                 dimnames = list(rnames,cnames))
mymatrix
mymatrix<-matrix(cells,nrow=2,ncol=2,byrow = FALSE,
                 dimnames = list(rnames,cnames))
mymatrix
x<-matrix(1:10,nrow = 2,ncol = 5)
x
x[2,4]
x[2,]
x[,3]
x[1,c(2,4)]

#创建一个数组
dim1<-c("A1","A2","A3")
dim2<-c("B1","B2")
dim3<-c("C1","C2","C3")
z<-array(1:18,c(3,2,3),dimnames = list(dim1,dim2,dim3))
#c(3,2,3)的意思是行、列、矩阵数3个的维度
z[2,1,1]#找的是第1个矩阵的第二行第一列的元素

#创建一个数据框
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("type1","type2","type1","type1")
status<-c("poor","improved","excellent","poor")
patientDates<-data.frame(patientID,age,diabetes,status)
patientID
patientDates
#选取数据框中的元素
patientDates[1:2]#选1-2列
patientDates[2:4]
patientDates[c("age","diabetes")]#选择指定列
patientDates$age#选择其中一列
table(patientDates$age,patientDates$diabetes)
#age和diabetes的列联表
#代替$的捷径——attach()/detach()/with()
#用$的方法
summary(patientDates$age)
plot(patientDates$age,patientDates$diabetes)
plot(patientDates$age,patientDates$status)
#attach()
attach(patientDates)
summary(age)
plot(status,diabetes)#报错：字符型数据没办法做散点图
plot(patientID,age)
#with()
with(patientDates,{
  summary(age)
  plot(age,patientID)
})
#实例标识符row.name=
patientDates<-data.frame(patientID,age,diabetes,status,
                         row.names = patientID)
patientDates

#因子的使用
#输入数据
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("type1","type2","type1","type1")
status<-c("poor","improved","excellent","poor")
#使用因子函数
diabetes<-factor(diabetes)
diabetes
status<-factor(status,order=T,levels = 
                 c("poor","improved","excellent"))
patientDates<-data.frame(patientID,age,diabetes,status)
#显示对象的结构
str(patientDates)
#显示对象的统计概要
summary(patientDates)

#创建一个列表
g<-"my frist list"
h<-c(25,26,18,39)
j<-matrix(1:10,nrow=5)
k<-c("one","two","three")
mylist<-list(title=g,ages=h,j,k)
mylist
mylist[[1]]
mylist[[2]]
mylist["ages"]

########输入数据#############
#使用键盘输入数据
mydata<-data.frame(age=numeric(0),gender=character(0),
                   weight=numeric(0))#创建一个定义性质的无内容表
mydata<-edit(mydata)#编辑数据集，记得修改后要重新fix
fix(mydata)
plot(mydata)

######从剪切板导入文件#########
help("read.table")
data<-read.table(pipe("pbpaste"),header = T)

#用R语言抓取网页信息（简单版本）
library(XML)
url<-"http://hz.house.ifeng.com/detail/2014_10_28/50087618_1.shtml"
tbls<-readHTMLTable(url)
sapply(tbls,nrow)
pop<-readHTMLTable(url,which = 1)
write.csv(pop,file = "~/Desktop/pop.csv")

