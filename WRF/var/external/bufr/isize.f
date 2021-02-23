	INTEGER FUNCTION ISIZE (NUM)

C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C
C SUBPROGRAM:    ISIZE
C   PRGMMR: ATOR            ORG: NP12       DATE: 2009-03-23
C
C ABSTRACT: THIS FUNCTION COMPUTES AND RETURNS THE NUMBER OF CHARACTERS
C   NEEDED TO ENCODE THE INPUT INTEGER NUM AS A STRING.  IT DOES NOT
C   ACTUALLY ENCODE THE STRING BUT RATHER ONLY FIGURES OUT THE REQUIRED
C   SIZE.  NUM MUST BE AN INTEGER IN THE RANGE OF 0 TO 99999.
C
C PROGRAM HISTORY LOG:
C 2009-03-23  J. ATOR    -- ORIGINAL AUTHOR
C
C USAGE:    CALL ISIZE ( NUM )
C   INPUT ARGUMENT LIST:
C     NUM      - INTEGER: NUMBER TO BE ENCODED
C
C   OUTPUT ARGUMENT LIST:
C     ISIZE    - INTEGER: NUMBER OF CHARACTERS NECESSARY TO ENCODE NUM
C                AS A STRING
C
C REMARKS:
C    THIS ROUTINE CALLS:        BORT
C    THIS ROUTINE IS CALLED BY: READMT   UFBDMP   UFDUMP
C                               Normally not called by any application
C                               programs but it could be.
C
C ATTRIBUTES:
C   LANGUAGE: FORTRAN 77
C   MACHINE:  PORTABLE TO ALL PLATFORMS
C
C$$$

	CHARACTER*128 BORT_STR

C-----------------------------------------------------------------------
C-----------------------------------------------------------------------

	IF ( NUM .LT. 0 ) GOTO 900
	DO ISIZE = 1, 5
	  IF ( NUM .LT. 10**ISIZE ) RETURN
	ENDDO
	GOTO 900

	RETURN
900	WRITE(BORT_STR,'("BUFRLIB: ISIZE - INPUT NUMBER (",I7,'//
     .	  '") IS OUT OF RANGE")') NUM
	CALL BORT(BORT_STR)
	END
