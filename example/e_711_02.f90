!---------------------------------------------------
!     I/O�б��еı���������Ԫ�أ��������ͼ�Ԫ��
real b(99)
type your_data       
	integer age
	character(30) name
end type your_data

type(your_data) wang,zhang
wang .age =23
wang .name='Xiao Li'
zhang.age =30
zhang.name='Lao Wang'

write(*,"('hi')")
write(*,100) wang, zhang.age    !I/O�б���(*,100)֮��
100 format(I3,'   ',A,'(age=',I3,')') !˵��������ݵ���ʽ

read(*,300) n, b(n)             ! n��b(n)��I/O�б�
300 format(I2,F10.5)            ! ˵���������ݵ���ʽ
!---------------------------------------------------
end

