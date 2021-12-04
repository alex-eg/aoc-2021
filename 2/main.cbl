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
       01 WS-CMD PIC A(9).
       01 WS-CMD-NAME PIC X(8).
       01 WS-VALUE PIC 9(1).
       01 WS-EOF PIC A(1).
       01 WS-DEPTH PIC 9(4) VALUE IS 0.
       01 WS-POSITION PIC 9(4) VALUE IS 0.
       01 WS-ANSWER PIC 9(10).

       PROCEDURE DIVISION.
           PERFORM READ-FILE.
           DISPLAY 'Depth: ' WS-DEPTH
           DISPLAY 'Position: ' WS-POSITION
           MULTIPLY WS-DEPTH BY WS-POSITION GIVING WS-ANSWER
           DISPLAY 'Answer: ' WS-ANSWER
           STOP RUN.

       READ-FILE.
           OPEN INPUT CMD.
           PERFORM UNTIL WS-EOF='Y'
           READ CMD INTO WS-CMD
               AT END MOVE 'Y' TO WS-EOF
               NOT AT END PERFORM COMPUTATION 
           END-READ
           END-PERFORM.
           CLOSE CMD.

       COMPUTATION.
           UNSTRING WS-CMD
               DELIMITED BY SPACES
               INTO WS-CMD-NAME, WS-VALUE
           END-UNSTRING
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
