      implicit double precision(a-h,o-z)
      parameter (n=10,mmax=40000) ! Set to larger number compared to possible values
      dimension bval(n),x(mmax,13) ! Arrays for B_bin limits and reading data

      data bval/16000,17500,19000,20500,22000,25000,29000,33000,37000
     +        ,41000/ !B_bin bounds

      offset=10000 ! To write our files `fort.1000#' for the bin no #.
                   ! To avoid conflict with pre-assigned pointers, e.g. 6=print on screen
!     do i=1,n             !These lines to check the values of B_bin, not needed.
!     write(*,*)i,bval(i)
!     enddo

      read(2,*)m   ! Reading fort.2 to get the number of lines in the
                   ! input file
      
      do j=1,m                 !Line loop begins for input file read
      read(1,*)(x(j,i),i=1,13) !All columns are read into the array x

      do ii=1,n-1       !Loop for B_bin check begins
      ofile=offset+ii   !Filename decided
      bcol=x(j,10)      !Column 10 reassigned for efficiency of if loop
                        !Below, B values compared and written out in
                        !files with appropriate names. The 300 pointer
                        !skips the do loop when the right bin is found.
      if(bcol.ge.bval(ii).and.bcol.le.bval(ii+1))then
      write(ofile,"(13e15.6)")(x(j,k),k=1,13)
      go to 300
      endif
      enddo

 300  write(*,*)ii      !To check if correct bins are identified. 
      write(*,*)(x(j,k),k=1,13) !To write out the entire input, again.
      enddo

      end
