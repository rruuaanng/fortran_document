! �����η��� a*x**2+b*x+c=0
print *, '����3��ϵ��'; read *, a,b,c

if(abs(a).le.tiny(a)) then
	print *, 'a��ֵС���������Сʵ������Ϊ����'
	if(abs(b).le.tiny(b)) then
		print *, 'b��ֵС���������Сʵ������Ϊ����'
		if(abs(c).le.tiny(c)) then
			print *, 'c��ֵС���������Сʵ������Ϊ����'
			print *, '���ʽ0=0�������'
		else
			print *, '�޽�'
		end if
	else
		print *, 'һ���⣺x=', -c/b
	end if
else
	p1=-b/(2*a); s=b**2-4*a*c; p2=sqrt(abs(s))/(2*a)
	if(s<0.) then
		print *, '���������⣺x=', p1, ' +-', p2, 'i'
	else if (abs(s).le.tiny(s)) then
		print *, '�ظ�      ��x=', p1
	else
		print *, '����ʵ���⣺x=', p1, ' +-', p2
	end if
end if
end

