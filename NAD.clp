;;;====================================================== ;;;
;;;   Nuclear Anomalies Dectection Expert System          ;;;
;;;   Author : Enning JIA                                 ;;;
;;;   A simple expert system for detecting the Anomalies  ;;;
;;;   at the nucelear plant                               ;;;
;;;====================================================== ;;;

(defrule main-radiation
=>
(printout t "======================================================  "crlf)
(printout t "   Nuclear Anomalies Dectection Expert System           "crlf)
(printout t "   Author : Enning JIA                                  "crlf)
(printout t "   A simple expert system for detecting the anomalies   "crlf)
(printout t "   at the nucelear plant                                "crlf)
(printout t "======================================================  "crlf)
(printout t"Is there any radiation has been found ?(yes/no) ")
(assert(radiation(read))))

;;;======================================================
(defrule radiation-no
(radiation no)
=>
(printout t" Does the weather good ? (yes/no) "crlf)
(assert(weather(read))))
;;;======================================================
(defrule weather-yes
(weather yes)
=>
(printout t" Does the temperature above 30 degree ?(yes/no) ")
(assert(degree(read))))
;;;======================================================
(defrule degree-yes
(degree yes)
=>
(printout t" Does cooling system still work ?(yes/no) ")
(assert(cooling(read))))
;;;======================================================
(defrule cooling-yes
(cooling yes)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule cooling-no
(cooling no)
=>
(printout t" Might have anomalies "crlf)
(bind $?anomalies might have)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule degree-no
(degree no)
=>
(printout t" Does the tempeature between 23 to 30 degree ?(yes/no)"crlf)
(assert(23-to-30-degree(read))))
;;;======================================================
(defrule 23-to-30-degree-yes
(23-to-30-degree yes)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule 23-to-30-degree-no
(23-to-30-degree no)
=>
(printout t" Is it winter now ?(yes/no)"crlf)
(assert(winter(read))))
;;;======================================================
(defrule winter-no
(winter no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule winter-yes
(winter yes)
=>
(printout t" Does the tempeature below negative 10 degree ?(yes/no)"crlf)
(assert(negative(read))))
;;;======================================================
(defrule negative-no
(negative no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule negative-yes
(negative yes)
=>
(printout t" Does every parts of the system are still operating ?(yes/no)"crlf)
(assert(system(read))))
;;;======================================================
(defrule system-yes
(system yes)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule negative-no
(negative no)
=>
(printout t" Keeping update information "crlf)
(bind $?anomalies keeping)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule weather-no
(weather no)
=>
(printout t" Is it raining ?(yes/no) ")
(assert(raining(read))))
;;;======================================================
(defrule raining-no
(raining no)
=>
(printout t" Is it snowing ?(yes/no) ")
(assert(snowing(read))))
;;;======================================================
(defrule snowing-yes
(snowing yes)
=>
(printout t" Does the average snowfall over 6 mm within 12 hours ?(yes/no) ")
(assert(snowfall(read))))
;;;======================================================
(defrule snowfall-no
(snowfall no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule snowfall-yes
(snowfall yes)
=>
(printout t" Remainder for natural diaster "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule snowing-no
(snowing no)
=>
(printout t" Is it windy?(yes/no) ")
(assert(windy(read))))
;;;======================================================
(defrule windy-no
(windy no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule windy-yes
(windy yes)
=>
(printout t" Does the wind scale more than 7 ? (yes/no)")
(assert(wind-scale(read))))
;;;======================================================
(defrule wind-scale-yes
(wind-scale yes)
=>
(printout t" Remainder for natural diaster "crlf)
(bind $?anomalies reamainder)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule wind-scale-no
(wind-scale no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule raining-yes
(raining yes)
=>
(printout t" Does the average preclpitation between 10 to 25 mm?(yes/no) ")
(assert(preclpitation(read))))
;;;======================================================
(defrule preclpitation-no
(preclpitation no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule preclpitation-yes
(preclpitation yes)
=>
(printout t" Does the average preclpitation still increasing ? (yes/no)")
(assert(increasing(read))))
;;;======================================================
(defrule increasing-no
(increasing no)
=>
(printout t" Noramal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule increasing-yes
(increasing yes)
=>
(printout t" Does the average preclpitation increasing to between 100 and 250 mm ? (yes/no)")
(assert(increasing-to(read))))
;;;======================================================
(defrule increasing-still-no
(increasing-still no)
=>
(printout t" Keep tracking the weather changing "crlf)
(bind $?anomalies tracking)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule increasing-still-yes
(increasing-still yes)
=>
(printout t" Are there any seeper ? (yes/no)")
(assert(seeper(read))))
;;;======================================================
(defrule seeper-no
(seeper no)
=>
(printout t" Normal "crlf)
(bind $?anomalies normal)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule seeper-yes
(seeper yes)
=>
(printout t" Prepare to get rid of the seeper "crlf)
(bind $?anomalies rid)
(assert(anomalies-is $?anomalies)))
;;;======================================================
;;;******************************************************
;;;======================================================
;;;******************************************************
;;;======================================================

(defrule radiation-yes
(radiation yes)
=>
(printout t" Does the energy of the radiated particles more than 10eV ?(yes/no) ")
(assert(particles-energy-more-than-10eV(read))))
;;;======================================================
(defrule particles-energy-more-than-10eV-no
(particles-energy-more-than-10eV no)
=>
(printout t"Does the surrounding have any temperature change ?(yes/no) ")
(assert(temparture-change(read))))
;;;======================================================
(defrule temparture-change-yes
(temparture-change yes)
=>
(printout t"Does the wavelength of the radiation between 400nm to 700nm ?(yes/no) ")
(assert (radiation-wavelength(read))))
 ;;;======================================================
(defrule radiation-wavelength-no
(radiation-wavelength no)
=>
(printout t" The non-ionzing radiation is infrared "crlf)
(bind $?anomalies infrared)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule radiation-wavelength-yes
(radiation-wavelength yes)
=>
(printout t" The non-ionzing radiation is visible light "crlf)
(bind $?anomalies visible light)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule temparture-change-no
(temparture-change no)
=>
(printout t"Does the wavelength of the radiation greater than 1mm ?(yes/no) ")
(assert (radiation-wavelength-mm(read))))
 ;;;======================================================
(defrule radiation-wavelength-mm-no
(radiation-wavelength-mm no)
=>
(printout t" The non-ionzing radiation is ultravidet "crlf)
(bind $?anomalies ultravidet)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule radiation-wavelength-mm-yes
(radiation-wavelength-mm yes)
=>
(printout t" The non-ionzing radiation is radio waves "crlf)
(bind $?anomalies radio waves)
(assert(anomalies-is $?anomalies)))
;;;======================================================
;;;******************************************************
;;;======================================================
;;;******************************************************
;;;======================================================

(defrule particles-energy-more-than-10eV-yes
(particles-energy-more-than-10eV yes)
=>
(printout t"Does it have the charged particles being found ?(yes/no) ")
(assert(charged-particles(read))))
;;;======================================================
(defrule charged-particles-yes
(charged-particles yes)
=>
(printout t"Does it have secondary radiation being found ?(yes/no) ")
(assert (secondary-radiation(read))))
 ;;;======================================================
(defrule secondary-radiation-yes
(secondary-radiation yes)
=>
(printout t" The ionzing radiation is charged nucelear "crlf)
(bind $?anomalies charged nucelear)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule charged-particles-no
(charged-particles no)
=>
(printout t"Can the radiation stopped by a sheet of paper ?(yes/no) ")
(assert (stopped-by-paper(read))))
 ;;;======================================================
(defrule stopped-by-paper-no
(stopped-by-paper no)
=>
(printout t" The ionzing radiation is Beta particles "crlf)
(bind $?anomalies Beta particles)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule stopped-by-paper-yes
(stopped-by-paper yes)
=>
(printout t" The ionzing radiation is Alpha particles "crlf)
(bind $?anomalies Alpha particles)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule charged-particles-no
(charged-particles no)
=>
(printout t"Does it interact with the protons ?(yes/no) ")
(assert (interact-protons(read))))
 ;;;======================================================
(defrule interact-protons-yes
(interact-protons yes)
=>
(printout t" The ionzing radiation is neutrons "crlf)
(bind $?anomalies neutrons)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule interact-protons-no
(interact-protons no)
=>
(printout t"Does it have the energy level between 120eV and 120keV ?(yes/no) ")
(assert (energy-level(read))))
 ;;;======================================================
(defrule energy-level-yes
(energy-level yes)
=>
(printout t" The ionzing radiation is X rays "crlf)
(bind $?anomalies X rays)
(assert(anomalies-is $?anomalies)))
;;;======================================================
(defrule energy-level-no
(energy-level no)
=>
(printout t" The ionzing radiation is gamma rays "crlf)
(bind $?anomalies gamma rays)
(assert(anomalies-is $?anomalies)))
;;;======================================================
;;;******************************************************
;;;======================================================
;;;******************************************************
;;;======================================================

(defrule explanation
(why)
=>
(printout t "==============================" crlf)
(retract 0)
(facts)
(printout t "==============================" crlf)
)
