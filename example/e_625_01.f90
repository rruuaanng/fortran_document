PROGRAM main
	INTERFACE
		REAL FUNCTION trace(sqr)
			REAL,INTENT(IN) :: sqr(:,:) ! ��������
		END FUNCTION
	END INTERFACE   

	REAL,ALLOCATABLE :: a(:,:)
	INTEGER :: n,i
	PRINT*,'�������������(������)='
	READ*, n
	ALLOCATE(a(n,n))
	DO i=1,n
		PRINT '(A,I2,A)','��',i,'��Ԫ��='
		READ *, a(i,1:n)
	END DO
	PRINT '(A,F7.4)','Trace = ',trace(a)
END

FUNCTION trace(x) RESULT(tr)
	REAL,INTENT(IN) :: x(:,:)      ! 2ά����
	REAL :: tr
	INTEGER :: n1,n2,i
	n1=SIZE(x,1); n2=SIZE(x,2)
	IF(n1/=n2) THEN
		PRINT*,'����������' ; RETURN
	ELSE
		tr=0.
		DO i=1,n1
			tr=tr+x(i,i)
		END DO
	END IF
END FUNCTION
