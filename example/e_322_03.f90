!��ת���������27��6������27����6������Ϊ3������6����3������Ϊ�㣬��3Ϊ���Լ����
read *, m,n
if(m.lt.n) then
	k=m; m=n; n=k
end if
k=mod(m,n)
do while (k/=0)
	m=n; n=k; k=mod(m,n)
end do
print *, '���Լ����',n
end