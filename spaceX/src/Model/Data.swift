import Foundation
class RocketData {
    var generalName: String = ""
    var imageName: String = ""
    var launchDate: String = ""
    var countryName: String = ""
    var launchCost: Int = 0
    let firstStage = "ПЕРВАЯ СТУПЕНЬ"
    var firstStageEngines: Int = 0
    var firstStageFuel: Int = 0
    var firstStageBurningTime = 0
    let secondStage = "ВТОРАЯ СТУПЕНЬ"
    var secondStageEngines: Int = 0
    var secondStageFuel: Int = 0
    var secondStageBurningTime = 0
    //var launchList = String
    let rocketLaunchesButton:String = "Посмотреть запуски"
    
    init(generalName: String, imageName: String, launchDate: String, countryName: String, launchCost: Int, firstStageEngines: Int, firstStageFuel: Int, firstStageBurningTime: Int, secondStageEngines: Int, secondStageFuel: Int, secondStageBurningTime: Int) {
        self.generalName = generalName
        self.imageName = imageName
        self.launchDate = launchDate
        self.countryName = countryName
        self.launchCost = launchCost
        self.firstStageEngines = firstStageEngines
        self.firstStageFuel = firstStageFuel
        self.firstStageBurningTime = firstStageBurningTime
        self.secondStageEngines = secondStageEngines
        self.secondStageFuel = secondStageFuel
        self.secondStageBurningTime = secondStageBurningTime
    }
}
