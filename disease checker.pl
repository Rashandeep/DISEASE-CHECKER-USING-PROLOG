check:-
write('***********************************************'),
nl,
write('*******CORONA, MALARIA AND DENGUE CHECKER******'),
nl,
write('***********************************************'),
nl,
checkfor(Disease),
write('I believe that the patient have '),
write(Disease),
nl,
write('TAKE CARE '),
undo.

/* diseases that should be tested */
checkfor(covid):-covid,!.
checkfor(malaria) :- malaria, !.
checkfor(dengue) :- dengue,!.
checkfor(no_disease). /* no diagonosis*/

/* rules to to check for disease */
covid:-
checkSymptom(fever_or_chills),
checkSymptom(cough),
checkSymptom(breathing_difficulty),
checkSymptom(fatigue),
write('Advices and Sugestions:'),
nl,
write('1: Stay isolated in one room '),
nl,
write('2: Wear a face mask when near others.'),
nl,
write('3: Clean often-touched surfaces'),
nl,
write('Please qurantine yourself or contact doctor because'),
nl.

malaria :-
checkSymptom(fever),
checkSymptom(sweating),
checkSymptom(headache),
checkSymptom(nausea),
checkSymptom(vomiting),
checkSymptom(diarrhea),
write('Advices and Sugestions:'),
nl,
write('1: Aralen/tab'),
nl,
write('2: Qualaquin/tab'),
nl,
write('3: Plaquenil/tab'),
nl,
write('4: Mefloquine'),
nl,
write('Please do not sleep in open air and cover your full skin Because'),
nl.

dengue :-
checkSymptom(high_fever),
checkSymptom(headache),
checkSymptom(pain_behind_eyes),
checkSymptom(vomiting),
checkSymptom(joint_pain),
write('Advices and Sugestions:'),
nl,
write('1: Preventing dehydration'),
nl,
write('2: tylenol or paracetamol/tab'),
nl,
write('3: Non-steroidal anti-inflammatory drugs (NSAIDs), such as aspirin or ibuprofen, are not advised, as they can increase the risk of internal bleeding.'),
nl,
write('Please do not sleep in open air and cover your full skin Because'),
nl.

askQuestion(Question):-
write('Does the patient have following symptom:'),
write(Question),
write('? '),
read(Reply),
nl,
((Reply == yes ; Reply == y)
->
assert(yes(Question));  /* assert yes to the ques add to wroking memory */
assert(no(Question)),fail).  /* assert no to ques and fail*/

:- dynamic yes/1,no/1.  /* yes or no will change dynamically according to the conditions */

/*How to verify something */
checkSymptom(S):-
(yes(S)
->
true ;
(no(S)
->
fail ;
askQuestion(S))).

/* clearing all the memory assigned using undo statements */
undo:-retract(yes(_)),fail.
undo:-retract(no(_)),fail.
undo.