read *, n
i=2; k=0
do while (i<=int(sqrt(n*1.)) .and. k==0)
    if(mod(n,i).eq.0) then
        k=i
    else
        i=i+1
    end if
end do
if(k==0) then
    print *, '������'
else
    print *, '�����������ɱ�',k,'����'
end if
end