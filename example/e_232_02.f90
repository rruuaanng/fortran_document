character*1 cmdchar
key_input: select case(cmdchar)
	case('0')
		print *, '�ļ�������1-9'
	case('1':'9')
		call RetrieveNumFiles(cmdchar)
	case('A','a')
		call AddEntry
	case('D','d')
		call DeletEntry
	case('H','h')
		call Help
    case default
		print *, '������������H�鿴����'
end select key_input
END
