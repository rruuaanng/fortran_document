PROGRAM Radioactive_Decay
!--------------------------------------------------------
! ����������Ԫ�صĳ���ֵ�Ͱ�˥�ڣ�����һ��ʱ����ʣ����
! ��������
!��      InitialAmount     : ������Ԫ�صĳ���ֵ(mg)
!        RemainingAmount   : ������Ԫ�ص�ʣ����(mg)
!        HalfLife          : ������Ԫ�صİ�˥��(��)
!        Time              : ����ʱ��          (��)
! ���������InitialAmount��HalfLife��Time
! ���������RemainingAmount
!--------------------------------------------------------

IMPLICIT NONE
REAL :: InitialAmount, RemainingAmount, HalfLife, Time

PRINT *, "�������ֵ(mg)����˥��(��)��ʱ��(��)"
READ  *, InitialAmount, HalfLife, Time

RemainingAmount=InitialAmount*0.5**(Time/HalfLife)
PRINT *, "ʣ����=",RemainingAmount," (mg)"

END PROGRAM Radioactive_Decay