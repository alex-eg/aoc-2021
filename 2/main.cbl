       IDENTIFICATION DIVISION.
       PROGRAM-ID. AOC-2021-TASK-2.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CMD ASSIGN TO "input.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD CMD.
       01 CMD-FILE.
           05 PIC A(9).

       WORKING-STORAGE SECTION.
      * Input file contents
       01 WS-CMD PIC A(9).
       01 WS-CMD-NAME PIC X(8).
       01 WS-VALUE PIC 9(20).
      * File EOF flag
       01 WS-EOF PIC A(1).
      * Computation-related variables
       01 WS-DEPTH PIC 9(8) VALUE IS 0.
       01 WS-POSITION PIC 9(6) VALUE IS 0.
       01 WS-AIM PIC S9(5) VALUE IS 0.
       01 WS-ANSWER PIC 9(11).

       PROCEDURE DIVISION.
           PERFORM READ-FILE.
           DISPLAY 'Depth: ' WS-DEPTH
           DISPLAY 'Position: ' WS-POSITION
           DISPLAY 'Aim: ' WS-AIM
           MULTIPLY WS-DEPTH BY WS-POSITION GIVING WS-ANSWER
           DISPLAY 'Answer: ' WS-ANSWER
           STOP RUN.

       READ-FILE.
           OPEN INPUT CMD.
           PERFORM UNTIL WS-EOF='Y'
           READ CMD INTO WS-CMD
               AT END MOVE 'Y' TO WS-EOF
               NOT AT END
                   UNSTRING WS-CMD
                       DELIMITED BY SPACES
                       INTO WS-CMD-NAME, WS-VALUE
                   END-UNSTRING
                   PERFORM PART-2
           END-READ
           END-PERFORM.
           CLOSE CMD.

       PART-1.
           IF WS-CMD-NAME = "forward" THEN
               ADD WS-VALUE TO WS-POSITION GIVING WS-POSITION
           ELSE IF WS-CMD-NAME = "up" THEN
               SUBTRACT WS-VALUE FROM WS-DEPTH GIVING WS-DEPTH
           ELSE IF WS-CMD-NAME = "down" THEN
               ADD WS-VALUE TO WS-DEPTH GIVING WS-DEPTH
           ELSE
               DISPLAY "Wrong cmd value :" WS-CMD-NAME
               MOVE 'Y' TO WS-EOF
           END-IF.

       PART-2.
           IF WS-CMD-NAME = "forward" THEN
               ADD WS-VALUE TO WS-POSITION GIVING WS-POSITION
               MULTIPLY WS-VALUE BY WS-AIM GIVING WS-VALUE
               ADD WS-VALUE TO WS-DEPTH GIVING WS-DEPTH
           ELSE IF WS-CMD-NAME = "up" THEN
               SUBTRACT 1 FROM WS-AIM GIVING WS-AIM
           ELSE IF WS-CMD-NAME = "down" THEN
               ADD 1 TO WS-AIM GIVING WS-AIM
           ELSE
               DISPLAY "Wrong cmd value :" WS-CMD-NAME
               MOVE 'Y' TO WS-EOF
           END-IF.
