read *, n
j=int(sqrt(n*1.));	i=2
do while ((mod(n,i)/=0) .and. (i<=j))
	i=i+1
end do
if(i<j) then
	print *, '�����������ɱ�',i,'����'
else
	print *, '������'
end if
end