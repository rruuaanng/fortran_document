INTEGER :: n=0
CHARACTER(LEN=1) :: a,b,c 
a='A';b='B';c ='C'
DO WHILE(n<=0)
	PRINT*, "�����̵ĸ���"
	READ*, n
END DO
CALL hanoi(n,a,b,c)
END

RECURSIVE SUBROUTINE hanoi(i,x,y,z)
	INTEGER,INTENT(IN) :: i
	CHARACTER(LEN=1),INTENT(IN) :: x,y,z
	IF(i>0) THEN
		CALL hanoi(i-1,x,z,y)
		PRINT '("��",I2,"�����ӣ���",A1,"������",A1,"��")',i,x,y
		CALL hanoi(i-1,z,y,x)
	END IF
END
