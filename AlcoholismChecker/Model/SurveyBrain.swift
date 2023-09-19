//
//  SurveyBrain.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/08/01.
//

import Foundation

struct SurveyBrain {
    
    let surveies = [
        Survey(
            title: "얼마나 자주 술을 마십니까?",
            choice1: "전혀 안마심",
            point1: 0,
            choice2: "월 1회 이하",
            point2: 1,
            choice3: "월 2~4회",
            point3: 2,
            choice4: "주 2~3회",
            point4: 3,
            choice5: "주 4회",
            point5: 4
        ),
        Survey(
            title: "술을 마시는 날은 보통 몇 잔을 마십니까?",
            choice1: "1~2잔",
            point1: 0,
            choice2: "3~4잔",
            point2: 1,
            choice3: "5~6잔",
            point3: 2,
            choice4: "7~9잔",
            point4: 3,
            choice5: "10잔 이상",
            point5: 4
        ),
        Survey(
            title: "한번 술좌석에서 6잔(또는 맥주 2천cc) 이상을 마시는 횟수는 몇 번입니까?",
            choice1: "없음",
            point1: 0,
            choice2: "월1회 미만",
            point2: 1,
            choice3: "월1회",
            point3: 2,
            choice4: "주1회",
            point4: 3,
            choice5: "거의 매일",
            point5: 4
        ),
        Survey(
            title: "지난 1년간, 일단 술을 마시기 시작하여 자제가 안 된 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "월1회 미만",
            point2: 1,
            choice3: "월1회",
            point3: 2,
            choice4: "주1회",
            point4: 3,
            choice5: "거의 매일",
            point5: 4
        ),
        Survey(
            title: "지난 1년간, 음주 때문에 일상생활에 지장을 받은 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "월1회 미만",
            point2: 1,
            choice3: "월1회",
            point3: 2,
            choice4: "주1회",
            point4: 3,
            choice5: "거의 매일",
            point5: 4
        ),
        Survey(
            title: "지난 1년간, 과음 후 다음날 아침 정신을 차리기 위해 해장술을 마신 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "월1회 미만",
            point2: 1,
            choice3: "월1회",
            point3: 2,
            choice4: "주1회",
            point4: 3,
            choice5: "거의 매일",
            point5: 4
        ),
        Survey(
            title: "지난 1년간, 음주 후 술을 마신것에 대해 후회한 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "월1회 미만",
            point2: 1,
            choice3: "월1회",
            point3: 2,
            choice4: "주1회",
            point4: 3,
            choice5: "거의 매일",
            point5: 4
        ),
        Survey(
            title: "지난 1년간, 술이 깬 후에 취중의 일을 기억할 수 없었던 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "월1회 미만",
            point2: 1,
            choice3: "월1회",
            point3: 2,
            choice4: "주1회",
            point4: 3,
            choice5: "거의 매일",
            point5: 4
        ),
        Survey(
            title: "당신의 음주로 인해 자신이나 다른 사람이 다친 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "",
            point2: 0,
            choice3: "있지만 지난 1년간 없음",
            point3: 2,
            choice4: "",
            point4: 0,
            choice5: "지난 1년간 있음",
            point5: 4
        ),
        Survey(
            title: "가족이나 의사가 당신의 음주에 대해 걱정을 하거나 술을 끊으라고 권고를 한 적이 있습니까?",
            choice1: "없음",
            point1: 0,
            choice2: "",
            point2: 0,
            choice3: "있지만 지난 1년간 없음",
            point3: 2,
            choice4: "",
            point4: 0,
            choice5: "지난 1년간 있음",
            point5: 4
        )
    ]
    
    var surveyNumber = 0
    var score = 0
    var isSurveyComplete = false
    
    func getSurveyTitle() -> String {
        return surveies[surveyNumber].title
    }
    
    func getChoice1() -> String {
        return surveies[surveyNumber].choice1
    }
    
    func getChoice2() -> String {
        return surveies[surveyNumber].choice2
    }
    
    func getChoice3() -> String {
        return surveies[surveyNumber].choice3
    }
    
    func getChoice4() -> String {
        return surveies[surveyNumber].choice4
    }
    
    func getChoice5() -> String {
        return surveies[surveyNumber].choice5
    }
    
    mutating func checkChoice(_ userChoice: String) {
        if userChoice == surveies[surveyNumber].choice1 {
            score += surveies[surveyNumber].point1
        }
        else if userChoice == surveies[surveyNumber].choice2 {
            score += surveies[surveyNumber].point2
        }
        else if userChoice == surveies[surveyNumber].choice3 {
            score += surveies[surveyNumber].point3
        }
        else if userChoice == surveies[surveyNumber].choice4 {
            score += surveies[surveyNumber].point4
        }
        else if userChoice == surveies[surveyNumber].choice5 {
            score += surveies[surveyNumber].point5
        }
    }
    
    func getProgress() -> Float {
        let progress = Float(surveyNumber) / Float(surveies.count)
        return progress
    }
    
    mutating func nextSurvey() {
        print(surveies.count)
        if surveyNumber + 1 < surveies.count {
            surveyNumber += 1
            print(surveyNumber)
        }
        else {
            isSurveyComplete = true
            print("끝")
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
