      implicit double precision(a-h,o-z)
      parameter (mmax=40000) ! Set to larger number compared to possible values
      dimension x(mmax,13) ! Arrays for B_bin limits and reading data

      read(2,*)m,el1,el2,alpha1,alpha2 !Reading fort.2 to get the number of lines in the
                   ! input file, the limits of L and alpha values for a
                   ! particuar grid.
      
      do j=1,m                 !Line loop begins for input file read
      read(1,*)(x(j,i),i=1,13) !All columns are read into the array x

      el=x(j,13)      !Column 13 reassigned for efficiency of if loop
      alpha=x(j,11)   !Column 11 reassigned for efficiency of if loop
      if(el.ge.el1.and.el.le.el2.and.
     +   alpha.ge.alpha1.and.alpha.le.alpha2)then
      write(22222,"(13e15.6)")(x(j,k),k=1,13) !Output in fort.22222
      endif

      enddo
      
      end
