implicit none
integer :: score,n0=0,n1=0,n2=0,n3=0,n4=0
do 
	read *, score
	if(score<0 .or. score>100) then
		print *,'����=',n0,' ��=',n1,' ��=',n2,' ����=',n3,' ������=',n4
		exit
	else
		select case(score)
			case(100)
				print *, '����'; n0=n0+1
			case(85:99)
				print *, '��  '; n1=n1+1
			case(70:84)
				print *, '��  '; n2=n2+1
			case(60:69)
				print *, '����'; n3=n3+1
			case default
				print *, '������'; n4=n4+1
		end select
	end if
end do
END
