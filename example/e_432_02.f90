PROGRAM Student_Records
IMPLICIT NONE
!-----------------------------------------------------------------------------------------
INTEGER, PARAMETER :: NameLen=20
!_________________________________________
TYPE StudentRecord
	CHARACTER(NameLen) :: Name
	INTEGER(1)         :: Score
END TYPE StudentRecord
!_________________________________________
TYPE(StudentRecord) :: Student
INTEGER(1)          :: EOF, RecLen, RecNo
LOGICAL             :: ThereIs
CHARACTER(NameLen)  :: FileName
CHARACTER           :: Ans*1, FileStatus*7
CHARACTER(*),PARAMETER :: NameChars=' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
!-----------------------------------------------------------------------------------------
INQUIRE(IOLENGTH=RecLen) Student
WRITE(*,"('�����ļ�����')",ADVANCE='NO')
READ *, FileName
INQUIRE(FILE=FileName,EXIST=ThereIs)

IF(ThereIs) THEN
	WRITE(*,'(a)',ADVANCE='NO') '�ļ��Ѵ��ڣ��Ƿ�ɾ�����ؽ�(Y/N)��'
	READ *, Ans
	IF(Ans=='Y'.or.Ans=='y') THEN
		FileStatus='REPLACE'
	ELSE
		FileStatus='OLD'
	END IF
ELSE
		FileStatus='NEW'
END IF

OPEN(1,FILE=FileName,STATUS=FileStatus,ACCESS='DIRECT',RECL=RecLen)
DO
	PRINT *
	PRINT *, "A: Add new records         �����¼"
	PRINT *, "D: Display all records     ��ʾ��¼"
	PRINT *, "U: Update existing records ���¼�¼"
	PRINT *, "Q: Quit                    �˳�����"
	PRINT *
	WRITE(*,'(a)',ADVANCE='NO') '��ѡ�񲢰��س�����'
	READ *, Ans
	SELECT CASE(Ans)
		CASE('A','a')
			CALL AddRecords
		CASE('D','d')
			CALL DisplayRecords
		CASE('U','u')
			CALL UpDate
		CASE('Q','q')
			EXIT
	END SELECT
END DO
CLOSE(1)

CONTAINS
!==================================================
SUBROUTINE AddRecords
	RecNo=0 ; EOF=0
	DO WHILE(EOF==0)
		READ(1,REC=RecNo+1,IOSTAT=EOF)
		IF(EOF==0) RecNo=RecNo+1
	END DO
	RecNo=RecNo+1
	Student=StudentRecord(' ',0)
	DO WHILE(VERIFY(Student%Name,NameChars)==0)    !��֤���������ַ����Ƿ��г�Ӣ����ĸ�Ϳո�֮��������ַ�
		WRITE(*,'(a)',ADVANCE='NO') "����Ӣ��������"
		READ *, Student%Name
		IF(VERIFY(Student%Name,NameChars)==0) THEN
			WRITE(*,'(a)',ADVANCE='NO') '���������'
			CALL ReadIntCon(Student%Score)
			WRITE(1,REC=RecNo) Student
			RecNo=RecNo+1
		END IF
	END DO
END SUBROUTINE AddRecords
!==================================================
SUBROUTINE ReadIntCon(Num)
	INTEGER(1) :: Err, Num   !�罫��һ���ϲ��ڴ�����ʼ��Err=1�Ļ����൱���Զ�������SAVE����
	Err=1                    !�������һ���ӳ��򱻵���ʱ��Ч��
	DO WHILE(Err>0)
		READ(*,*,IOSTAT=Err) Num
		IF(Err>0 .or. Num<0 .or. Num>100) PRINT *,'�����������¼��룽'
	END DO
END SUBROUTINE ReadIntCon
!==================================================
SUBROUTINE DisplayRecords
	RecNo=1; EOF=0
	DO WHILE(EOF==0)
		READ(1,REC=RecNo,IOSTAT=EOF) Student
		IF(EOF==0) PRINT '(A20,I3)', Student
		RecNo=RecNo+1
	END DO
END SUBROUTINE DisplayRecords
!==================================================
SUBROUTINE UpDate
	CHARACTER(NameLen) :: Item, Copy
	LOGICAL :: Found                               !�����ж��Ƿ��ҵ�ĳ����¼
	Found=.false.                                  !��ʼʱ����ٶ�û���ҵ�
	EOF=0
	WRITE(*,'(a)',ADVANCE='NO') '����˭?��'
	READ *, Item                                   !Item��20���ֽڣ������Ҫ��
	CALL StripBlanks(Item)                         !��Ч�Ŀո�ɾȥ�����ƥ�����
	RecNo=1
	DO WHILE(EOF==0.AND..NOT.Found)
		READ(1,IOSTAT=EOF,REC=RecNo) Student
		IF(EOF==0) THEN
			Copy=Student%Name
			CALL StripBlanks(Copy)
			IF(Item==Copy) THEN
				Found=.true.
				WRITE(*,'(2(a,i3),a)',ADVANCE='NO') '�ҵ���¼��Ϊ��',&
					 RecNo, '   �ɷ�����',Student%Score,'   �����·�����'
				CALL ReadIntCon(Student%Score)
				WRITE(1,REC=RecNo) Student
			ELSE
				RecNo=RecNo+1
			END IF
		END IF
	END DO
	IF(.NOT.Found) PRINT *,' û���ҵ�', Item
END SUBROUTINE UpDate
!==================================================
SUBROUTINE StripBlanks(Str)
	CHARACTER(*) :: Str
	INTEGER(1) :: I=1
	DO WHILE(I<LEN_TRIM(Str))
		IF(Str(I:I)==' ') THEN
			Str(I:)=Str(I+1:)
		ELSE
			I=I+1
		END IF
	END DO
END SUBROUTINE StripBlanks
!==================================================
END PROGRAM Student_Records
