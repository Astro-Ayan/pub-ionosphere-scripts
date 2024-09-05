      implicit double precision(a-h,o-z)
      parameter(ngrid=100)
      dimension el(ngrid),nalpha(ngrid)

      read(2222,*)nline !Reads line numbers in reprocessed proc file


      do i=1,nline
      read(1111,*)el(i),nalpha(i) !Reads the reprocessed proc file
      write(*,*)el(i),nalpha(i)
      enddo

!!!!!!To ASSIGN INITIAL INDICES TO FILTERED L AND ALPHA VALUES!!!!!!!!!!!
      i=1
      n1=1    !For main grid index.
      n2=0    !For 2nd grid index which is active for multiple chunks.
      n3=1    !For counting how many alpha values are adjoint.
      kount=0 
 101  if(el(i).ne.el(i+1))then
      if(n2.ge.1)n2=n2+1
      kount=kount+1
      write(*,900)i,kount,n1,n2,n3,el(i),nalpha(i+1-n3),nalpha(i+1-n3)
     +            +15*n3
      write(33333,901)el(i),el(i)+0.1,nalpha(i+1-n3)*1.0,
     +      1.0*(nalpha(i+1-n3)+15*n3),n1,n2
      n1=n1+1
      n3=1
      n2=0
      elseif(el(i).eq.el(i+1).and.nalpha(i).ne.(nalpha(i+1)-15))then
      kount=kount+1
      n2=n2+1
      write(*,900)i,kount,n1,n2,n3,el(i),nalpha(i+1-n3),nalpha(i+1-n3)
     +            +15*n3
      write(33333,901)el(i),el(i)+0.1,nalpha(i+1-n3)*1.0,
     +      1.0*(nalpha(i+1-n3)+15*n3),n1,n2
      n3=1
      elseif(el(i).eq.el(i+1).and.nalpha(i).eq.(nalpha(i+1)-15))then
      n3=n3+1
      endif
      i=i+1
      if(i.le.nline)go to 101
 900  format (5I4,2x,F5.2,2x,2I4)
 901  format (2F5.1,2x,2F6.1,2x,2I)

      end
