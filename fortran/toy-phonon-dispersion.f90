program band_1d
  implicit none
  integer(4):: ifile,nfile
  character(len=32):: arg
  integer(4):: nat, nbond
  real(8):: alat
  integer(4):: iat,ibond
  real(8),allocatable:: mass(:),rpos(:)
  real(8),allocatable:: k(:)
  integer(4),allocatable:: iat1(:),iat2(:),t2(:)
  complex(8),allocatable:: dynkk(:,:)
  real(8), allocatable:: rek_vector(:),reomega2_vector(:)
  !
  nfile=command_argument_count()
  do ifile=1,nfile
     call get_command_argument(ifile,arg)
     open(unit=24,file=adjustl(arg))
     !
     read(24,*)
     read(24,*) nat,nbond,alat
     print*,nat,nbond,alat
     !
     allocate(mass(nat))
     allocate(rpos(nat))
     read(24,*)
     do iat=1,nat
        read(24,*) mass(iat),rpos(iat)
     end do
     !
     allocate(iat1(nbond))
     allocate(iat2(nbond))
     allocate(t2(nbond))
     allocate(k(nbond))
     read(24,*)
     do ibond=1,nbond
        read(24,*) iat1(ibond),iat2(ibond),t2(ibond),k(ibond)
     end do
     !
     allocate(rek_vector(nat))
     allocate(reomega2_vector(nat))
     allocate(dynkk(nat,nat))
     !
     call calculate_band(nat,mass,rpos,nbond,)
  end do
  !call execute_command_line("top")
end program band_1d
