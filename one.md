# One
(a) 
```Prolog
?- assignment(AS, march, DUE).
AS = as4,
DUE = 9 ;
AS = as5,
DUE = 16
```

(b)
`?- ta(cs312, 2023, Who), email(Who, Email).`
there is no answer for this, but we can add new fact `email(carol, "carol@cs.ubc.ca")`
```Prolog
WHO = carol,
EMAIL = "carol@cs.ubc.ca" ;
```

(c)
```Prolog
office_hour(WHO1, Day, _, _), office_hour(WHO2, Day, _, _), WHO1 \= WHO2.
WHO1 = carol,
Day = monday,
WHO2 = taher ;
WHO1 = taher,
Day = monday,
WHO2 = carol ;
WHO1 = carol,
Day = tuesday,
WHO2 = markus ;
WHO1 = markus,
Day = tuesday,
WHO2 = carol ;
WHO1 = vincent,
Day = thursday,
WHO2 = taher ;
WHO1 = taher,
Day = thursday,
WHO2 = vincent ;
WHO1 = markus,
Day = friday,
WHO2 = vincent ;
WHO1 = vincent,
Day = friday,
WHO2 = markus ;
```

(d)
```Prolog
?- office_hour(WHO, Day1, _, _), office_hour(WHO, Day2, _, _), nextday(Day1, Day2), pname(WHO, Name).
WHO = carol,
Day1 = monday,
Day2 = tuesday,
Name = "Carol" ;
WHO = vincent,
Day1 = thursday,
Day2 = friday,
Name = "Vincent" ;
false.
```

(e)
```Prolog
?- ta(cs312, 2023, WHO),\+office_hour(WHO, _, _, _).
false.
```

(f) 
1. The start date of the term or the previous midterm 
2. The date of the exam, provided in the `exam` facts.
3. The class schedule, like the days and times of each class, 

# Two
adding these definition to plumbing.pl
% (a)
```Prolog
:- dynamic on_t3/0, off_t3/0.
pressurized_p3 :- on_t1, pressurized_p1.
wet_sink :- on_t3, pressurized_p3.
%% this simulats if the sink is wet or not
```

% (b)
```Prolog
:- dynamic plugged_sink/0, unplugged_sink/0.
%%`` This simulats if the sink is plugged or not
wet_floor :- (wet_sink, unplugged_sink;); (wet_bath, unplugged_bath).
```

% (c)

# Three

## (a) 
for example, we choose `?- slithy`
The bottom-up proof procedure starts with the atoms that have no dependencies: `outgrabe`, `manxome`, and `wabe`. 
```
outgrabe             % Select the first clause of toves
manxome              % Select the second clause of toves
wabe                 % Select the second clause of slithy
gyre                 % Select the second clause of slithy
outgrabe             % Select the first clause of gimble
brillig              % Select the second clause of gimble
jubjub               % Select the first clause of brillig (failed)
manxome              % Select the second clause of toves again
gyre                 % Select the first clause of slithy (succeeded)
outgrabe             % Select the first clause of gimble again
vorpal               % Select the second clause of gimble
manxome              % Select the second clause of vorpal
```

## (b)
for the query  `?- slithy.`
```
slithy          % Select the first clause of slithy
toves           % Select the first clause of toves
outgrabe        % Select the first clause of toves again
vorpal          % Select the second clause of toves
manxome         % Select the second clause of vorpal
brillig         % Select the second clause of slithy
jubjub          % Select the first clause of brillig (failed)
```

## (c)
for the query  `?- slithy.`
```
slithy          % Select the first clause of slithy
toves           % Select the first clause of toves
outgrabe        % Select the first clause of toves again
vorpal          % Select the second clause of toves
manxome         % Select the second clause of vorpal
gyre            % Select the second clause of slithy
manxome         % Select the second clause of gyre
gimble          % Select the second clause of gyre
outgrabe        % Select the first clause of gimble
vorpal          % Select the second clause of gimble again
manxome         % Select the second clause of vorpal again
wabe            % Select the second clause of slithy again
```

## (d)
```Prolog
[trace]  ?- slithy.
   Call: (10) slithy ? creep
   Call: (11) toves ? creep
   Call: (12) outgrabe ? creep
   Exit: (12) outgrabe ? creep
   Call: (12) vorpal ? creep
   Call: (13) manxome ? creep
   Exit: (13) manxome ? creep
   Exit: (12) vorpal ? creep
   Exit: (11) toves ? creep
   Call: (11) brillig ? creep
   Call: (12) jubjub ? creep
   Fail: (12) jubjub ? creep
   Fail: (11) brillig ? creep
   Redo: (11) toves ? creep
   Call: (12) manxome ? creep
   Exit: (12) manxome ? creep
   Exit: (11) toves ? creep
   Call: (11) brillig ? creep
   Call: (12) jubjub ? creep
   Fail: (12) jubjub ? creep
   Fail: (11) brillig ? creep
   Redo: (10) slithy ? creep
   Call: (11) gyre ? creep
   Call: (12) manxome ? creep
   Exit: (12) manxome ? creep
   Exit: (11) gyre ? creep
   Call: (11) gimble ? creep
   Call: (12) outgrabe ? creep
   Exit: (12) outgrabe ? creep
   Exit: (11) gimble ? creep
   Call: (11) wabe ? creep
   Exit: (11) wabe ? creep
   Exit: (10) slithy ? creep
true .
```
Call: Indicates that Prolog is trying to satisfy a goal or subgoal.
Exit: Indicates that Prolog has successfully satisfied a goal or subgoal, and adds it to the consequence set.
Redo: Indicates that Prolog is attempting to redo or backtrack to a previous goal or subgoal, in order to find an alternative solution.
Fail: Indicates that Prolog has failed to satisfy a goal or subgoal, and backtracks to a previous goal or subgoal to try an alternative solution.

## (e)
`?- slithy.` has only one answer: true.


# Four
1. 10 mins, good question
2. 10 mins, not very reasonable, I don't quite understand the (3)rd question without picture
3. 30 mins, I don't quite understand the (4)th question
