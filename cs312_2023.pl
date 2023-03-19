% CPSC 312 2021 facts - the facts for assignment 4, question 1
% The facts may not be accurate. Consult web page for up-to-date information.
% Copyright David Poole 2021, licenced by CC BY-NC-SA 4.0 http://creativecommons.org/licenses/by-nc-sa/4.0/deed.en

% instructor(Course, Year, Who) is true if Who is the instructor for Course in Year
instructor(cs312,2023,davidp).

% ta(Course, Year, Who) is true if Who is a teaching assistant for Course in Year
ta(cs312,2023,carol).
ta(cs312,2023,markus).
ta(cs312,2023,taher).
ta(cs312,2023,vincent).

% pname(P,F) means person P's first name is F 
pname(davidp, "David").
pname(carol , "Carol").
pname(markus, "Markus").
pname(taher, "Taher").
pname(vincent, "Vincent").

% office(P,R) means room R is person P's office
office(davidp,iccs109).

% email(P,E) means E is person P's email address
email(davidp,"poole@cs.ubc.ca").
email(carol, "carol@cs.ubc.ca").

% assignment(A, M, D) means assigment A is due at 11:59pm on day D of month M
assignment(as1, january, 17).
assignment(as2, january, 24).
assignment(as3, february, 7).
assignment(as4, march, 9).
assignment(as5, march, 16).

% exam(E, M, D) means exam E is on day D of month M
exam(mid1, january, 30).
exam(mid2, february, 27).
exam(mid3, march, 20).
exam(final, april, 19).

% number_of_classes_before(E,D) is true if there are D classes
% (since the start of term or the previous midterm) before exam E
number_of_classes_before(mid1,9).
number_of_classes_before(mid2,8).
number_of_classes_before(mid3,8).
number_of_classes_before(final,8).

% office_hour(P, D, S, F) means the office hours for person P are are on day D from S to F (on a 24 hour clock).
% This is taken from the course piazza page
office_hour(carol, monday, 10, 11).
office_hour(taher, monday, 14.5, 15.5).
office_hour(carol, tuesday, 9.5, 10.5).
office_hour(markus, tuesday, 16, 17).
office_hour(davidp, wednesday, 14, 15).
office_hour(vincent, thursday, 13.5, 14.5).
office_hour(taher, thursday, 16, 17).
office_hour(markus, friday, 15, 16).
office_hour(vincent, friday, 15, 16).

% nextday(D1,D2) is true if D2 is the day after D1
nextday(monday,tuesday).
nextday(tuesday,wednesday).
nextday(wednesday,thursday).
nextday(thursday,friday).
