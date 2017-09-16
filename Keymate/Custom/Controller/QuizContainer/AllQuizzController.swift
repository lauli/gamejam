//
//  FirstQuiz.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class FirstQuiz: BaseQuizController {
    
    /*
     1. What team is the first oponnent of Gjovik Swans in upcoming season 2017/2018?
     A. Tonsberg Raiders
        B. Oslo Vikings
     C. Fredrikstad Kings
     D. Alesund Phoenix
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "B"
    }
}

class SecondQuiz: BaseQuizController {
    
    /*
     2. In which year Norway was the host of European Handball Championship?
     A. 2014
     B. 2010
        C. 2008
     D. 2006
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "C"
    }
}

class ThirdQuiz: BaseQuizController {
    
    /*
     3. In which city is located the Olympic Cavern Hall built for the Winter Olympics in 1993?
        A. Gjovik
     B. Oslo
     C. Hamar
     D. Lillehammer
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "A"
    }
}

class FourthQuiz: BaseQuizController {
    
    /*
     4. Which place did take Daniel-AndrÈ Tande in 65th Four Hills Tournament in 2016?
     A. 1
     B. 2
        C. 3
     D. 4
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "C"
    }
}

class FifthQuiz: BaseQuizController {
    
    /*
     5. What is maximum number of players of an ice hockey team?
     A. 24
        B. 22
     C. 20
     D. 19
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "B"
    }
}

class SixthQuiz: BaseQuizController {
    
    /*
     6. What are the club colors of football club Rosenborg BK Trondheim?
        A. Black & White
     B. Blue & White
     C. Red & Purple
     D. Black & Yellow
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "A"
    }
}

class SeventhQuiz: BaseQuizController {
    
    /*
     7. What is the biggest stadium in Norway (any type, in terms of capacity)?
     A. Ullevaal Stadion - Oslo
     B. Lysgardsbakkene - Lillehammer
     C. Granasen Stadion - Trondheim
        D. Holmenkollen Stadion - Oslo
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "D"
    }
}

class EighthQuiz: BaseQuizController {
    
    /*
     8. What is the place of first documented skiing competition in history?
     A. Lillehammer
     B. Narvik
        C. Tromso
     D. Alta

     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "C"
    }
}

class NinethQuiz: BaseQuizController {
    
    /*
     9. Who is the only Norwegian who has ever played in the NBA league?
     A. Nima Taheri
     B. Marco Elsafadi
     C. Frode Loftesnes
        D. Torgeir Bryn
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "D"
    }
}

class TenthQuiz: BaseQuizController {
    
    /*
     10. Which city is the host of upcoming Cycling Road World Championships?
        A. Bergen
     B. Oslo
     C. Stockholm
     D. Malmo
     */
    
    override func viewWillAppear(_ animated: Bool) {
        self.correctAnswer = "A"
    }
}
