! ��ѧʽ0 < x < 1 ����д�� (0.<x) .and. (x<1.) 

REAL :: x; READ *, x
IF(0.0 < x < 1.0) THEN
   PRINT *, "  ������(0, 1)��"
ELSE
   PRINT *, "��������(0, 1)��"
END IF

!print *, .true.<1., .false.<1.
END
