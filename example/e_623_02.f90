SUBROUTINE count(n)
   INTEGER :: sum=0            !sum�ĳ�ʼֵ�趨��Ҫ�������Ͷ��������
   DO i=1, 10
      sum=sum+i
   END DO
   n=sum                       !�ӳ���ִ�к�sum��ֵû�б�����
END

PROGRAM main
  INTEGER :: n
  CALL count(n); PRINT*, n
  CALL count(n); PRINT*, n
END


