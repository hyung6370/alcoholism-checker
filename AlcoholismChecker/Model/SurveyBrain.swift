//
//  AlcoholismSurveyBrain.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/08/01.
//

import Foundation

struct SurveyBrain {
    var surveyNumber = 0
    
    let surveies = [
        Survey (
            question: "얼마나 자주 술을 마십니까?",
            answer1: "전혀 안마심",
            point1: 0,
            answer2: "월 1회 이하",
            point2: 1,
            answer3: "월 2~4회",
            point3: 2,
            answer4: "주 2~3회",
            point4: 3,
            answer5: "주 4회",
            point5: 4
        ),
        Survey (
            question: "술을 마시는 날은 보통 몇 잔을 마십니까?",
            answer1: "1~2잔",
            point1: 0,
            answer2: "3~4잔",
            point2: 1,
            answer3: "5~6잔",
            point3: 2,
            answer4: "7~9잔",
            point4: 3,
            answer5: "10잔 이상",
            point5: 4
        ),
        Survey (
            question: "한번 술 좌석에서 6잔(또는 맥주 2천cc) 이상을 마시는 횟수는 몇 번입니까?",
            answer1: "없음",
            point1: 0,
            answer2: "월1회 미만",
            point2: 1,
            answer3: "월1회",
            point3: 2,
            answer4: "주1회",
            point4: 3,
            answer5: "거의 매일",
            point5: 4
        ),
        Survey (
            question: "지난 1년간, 일단 술을 마시기 시작하여 자제가 안 된 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "월1회 미만",
            point2: 1,
            answer3: "월1회",
            point3: 2,
            answer4: "주1회",
            point4: 3,
            answer5: "거의 매일",
            point5: 4
        ),
        Survey (
            question: "지난 1년간, 음주 때문에 일상생활에 지장을 받은 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "월1회 미만",
            point2: 1,
            answer3: "월1회",
            point3: 2,
            answer4: "주1회",
            point4: 3,
            answer5: "거의 매일",
            point5: 4
        ),
        Survey (
            question: "지난 1년간, 과음 후 다음날 아침 정신을 차리기 위해 해장술을 마신 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "월1회 미만",
            point2: 1,
            answer3: "월1회",
            point3: 2,
            answer4: "주1회",
            point4: 3,
            answer5: "거의 매일",
            point5: 4
        ),
        Survey (
            question: "지난 1년간, 음주 후 술을 마신것에 대해 후회한 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "월1회 미만",
            point2: 1,
            answer3: "월1회",
            point3: 2,
            answer4: "주1회",
            point4: 3,
            answer5: "거의 매일",
            point5: 4
        ),
        Survey (
            question: "지난 1년간, 술이 깬 후에 취중의 일을 기억할 수 없었던 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "월1회 미만",
            point2: 1,
            answer3: "월1회",
            point3: 2,
            answer4: "주1회",
            point4: 3,
            answer5: "거의 매일",
            point5: 4
        ),
        Survey (
            question: "당신의 음주로 인해 자신이나 다른 사람이 다친 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "x 공란 x",
            point2: 0,
            answer3: "있지만 지난 1년간 없음",
            point3: 2,
            answer4: "x 공란 x",
            point4: 0,
            answer5: "지난 1년간 있음",
            point5: 4
        ),
        Survey (
            question: "가족이나 의사가 당신의 음주에 대해 걱정을 하거나 술을 끊으라고 권고를 한 적이 있습니까?",
            answer1: "없음",
            point1: 0,
            answer2: "x 공란 x",
            point2: 0,
            answer3: "있지만 지난 1년간 없음",
            point3: 2,
            answer4: "x 공란 x",
            point4: 0,
            answer5: "지난 1년간 있음",
            point5: 4
        ),
    ]
    
    func getSurveyQuestion() -> String {
        return surveies[surveyNumber].question
    }
    
    func getAnswer1() -> String {
        return surveies[surveyNumber].answer1
    }
    
    func getAnswer2() -> String {
        return surveies[surveyNumber].answer2
    }
    
    func getAnswer3() -> String {
        return surveies[surveyNumber].answer3
    }
    
    func getAnswer4() -> String {
        return surveies[surveyNumber].answer4
    }
    
    func getAnswer5() -> String {
        return surveies[surveyNumber].answer5
    }
    
    mutating func nextSurvey(userAnswer: String) {
        let currentSurvey = surveies[surveyNumber]
        if userAnswer == currentSurvey.answer1 {
            surveyNumber = currentSurvey.point1
        } else if userAnswer == currentSurvey.answer2 {
            surveyNumber = currentSurvey.point2
        } else if userAnswer == currentSurvey.answer3 {
            surveyNumber = currentSurvey.point3
        } else if userAnswer == currentSurvey.answer4 {
            surveyNumber = currentSurvey.point4
        } else if userAnswer == currentSurvey.answer5 {
            surveyNumber = currentSurvey.point5
        }
        
        surveyNumber += 1
    }

}
