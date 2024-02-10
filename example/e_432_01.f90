PROGRAM Computer_Usage_Records
!===========================================================
!�Ӽ����϶�ȡ�û����룬���������ʹ�ü�¼�ļ����������һ�£�
!����ʾ�û�����Ϣ
!
!Computer_Usage_Info : 
!FileName            : 
!OpenStatus          :
!InputStatus         :
!User                : 
!InputNumber         : 
!UserNumber          : 
!Found               : 

!���루���̣���InputNumber
!���루�ļ�����UserNumber, User�е��û�������Ϣ
!�������Ļ�����û����룬�������������
!===========================================================
IMPLICIT NONE
TYPE Computer_Usage_Info
	CHARACTER(15) :: LastName, FirstName
	INTEGER       :: IdNumber
	CHARACTER(6)  :: Password
	INTEGER       :: ResourceLimit
	REAL          :: ResourceUsed
END TYPE Computer_Usage_Info

CHARACTER(20) :: FileName
TYPE(Computer_Usage_Info) :: User
INTEGER :: OpenStatus, InputStatus, InputNumber, UserNumber
LOGICAL :: Found

WRITE(*,'(a)',ADVANCE='NO') '�����ļ���='
READ *, FileName
OPEN(UNIT=10,FILE=FileName,STATUS='OLD',IOSTAT=OpenStatus)
IF(OpenStatus>0) STOP '���ܴ��ļ�'

DO
	PRINT *
	WRITE(*,'(a)',ADVANCE='NO') '�����û����루��ֹʱΪ0��='
	READ *, InputNumber
	IF(InputNumber==0) EXIT
	DO
		READ(10,'(T31,I5)', IOSTAT=InputStatus) UserNumber
		IF(InputStatus>0) STOP '�������'
		IF(InputStatus<0) EXIT
		Found=(InputNumber==UserNumber)
		IF(Found) EXIT
	END DO
	IF(Found) THEN
		BACKSPACE 10
		READ(10,'(2A15,10X,I4,F5.2)') &
			User%LastName, User%FirstName, &
			User%ResourceLimit, User%ResourceUsed
		PRINT '(I5,1X,2A15/"�ܶ",I4,"  ��",F5.2)', &
			UserNumber, User%FirstName, User%LastName, &
			User%ResourceLimit, User%ResourceUsed
	ELSE
		PRINT *,'û���ҵ��û�',InputNumber
	END IF
	REWIND 10
END DO
END PROGRAM Computer_Usage_Records
