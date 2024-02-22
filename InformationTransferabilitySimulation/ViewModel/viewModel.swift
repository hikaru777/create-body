//
//  swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/17.
//

import Foundation
import UIKit
import SwiftUI


class viewModel: NSObject, ObservableObject {
    
    @Published var value0: Double = 5
    @Published var value1: Double = 5
    @Published var value2: Double = 5
    @Published var value3: Double = 5
    @Published var value4: Double = 5
    @Published var value5: Double = 5
    @Published var value6: Double = 5
    @Published var weight: Int = 130
    @Published var roundWeight: Int = 70
    @Published var color: Color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
    @Published var loding = false
    @Published var currentValue: Double = 5
    @Published var problemArray: [problemArray] = []
    
    var width: CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    
    func changeValue() {
        if value0 >= 70 {
            
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "水分過多", subTitle: "・浸透性失調:  過剰な水分摂取により、体内のナトリウムやその他の電解質の濃度が低下します。これは細胞の浸透圧と関連しており、細胞が腫れたり、脳の浮腫（脳の水分過多）を引き起こす可能性があります。\n\n・腹部不快感:  過剰な水分摂取により、胃や腸が過度に伸張し、腹部不快感や吐き気が生じる可能性があります。\n\n・低ナトリウム血症:  過剰な水分摂取により、体内のナトリウム濃度が低下する可能性があります。これは低ナトリウム血症として知られ、頭痛、めまい、けいれん、意識障害などの症状を引き起こす可能性があります。\n\n・心臓の負担:  過剰な水分摂取により、心臓の負担が増大する可能性があります。心臓は、血液の体積が増加すると、それを適切にポンプするためにより多くの作業をする必要があります。\n\n・尿素窒素の低下:  過剰な水分摂取により、尿素窒素などの尿中成分の濃度が低下する可能性があります。これは、腎臓の機能に影響を与える可能性があります。", text: "tapして起こりうる体調の異変を見る", color: .cyan, number: 1))
            withAnimation {
                color = .cyan
            }
            
        } else if value0 <= 60 {
            
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "水分不足", subTitle: "・体温調節の障害:  水は体温を調節するのに重要な役割を果たします。水分が不足すると、体温調節能力が低下し、熱中症などの問題が発生する可能性があります。 \n\n・血液の濃度上昇: 水分が不足すると、血液の濃度が上がります。これにより、心臓への負担が増大し、血圧が上昇する可能性があります。\n\n・代謝の低下: 水は体内で代謝反応に必要な溶媒として機能します。水分が不足すると、代謝が低下し、エネルギー生産が妨げられる可能性があります。\n\n・消化器系の問題: 水は消化にも重要です。十分な水分摂取がないと、便秘や消化不良などの消化器系の問題が生じる可能性があります。\n\n・脳機能の低下: 水分不足は集中力や記憶力の低下を引き起こす可能性があります。また、深刻な脱水症状ではめまいや意識障害が生じることもあります。 \n\n・腎臓の機能低下: 水は体内の老廃物を排泄する際にも重要です。水分不足が続くと、腎臓の機能が低下し、尿の量が減少する可能性があります。これにより、老廃物が体内に溜まり、健康に悪影響を与える可能性があります。", text: "tapして起こりうる体調の異変を見る", color: .cyan, number: 2))
            withAnimation {
                color = .yellow
            }
            
        }
        
        if value1 >= 25 {
            
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "タンパク質過多", subTitle: "・腎臓への負担：過剰なタンパク質摂取は、腎臓に余分な窒素を排泄させる必要があるため、腎臓に負担をかける可能性があります。これは、長期的には腎臓機能の低下や腎臓疾患のリスクを高める可能性があります。\n\n・カルシウムの排出： 高タンパク質の摂取は、カルシウムの排出を増やす可能性があります。これにより、骨密度が低下し、骨折や骨粗鬆症のリスクが高まる可能性があります。\n\n・栄養バランスの乱れ： タンパク質が過剰に摂取されると、他の栄養素、特に炭水化物や脂質など、バランスの取れた食事からの栄養摂取が減少する可能性があります。\n\n・環境への影響： 畜産業において、過剰なタンパク質需要は飼料の大量生産を必要とするため、環境に負荷をかけることがあります。", text: "tapして起こりうる体調の異変を見る", color: .green, number: 3))
            withAnimation {
                color = .blue
            }
            
        } else if value1 <= 15 {
            
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "タンパク質不足", subTitle: "・筋肉の減少：　 タンパク質は筋肉の主要な構成要素であり、不足すると筋肉量が減少し、筋力や運動能力が低下する可能性があります。 \n\n・免疫機能の低下： 免疫系の一部はタンパク質に依存しており、タンパク質が不足すると免疫機能が低下し、感染症に対する抵抗力が弱まる可能性があります。\n\n・貧血： ヘモグロビンやその他の血液中のタンパク質が不足すると、貧血のリスクが高まる可能性があります。これは、酸素を運ぶために赤血球が必要なためです。\n\n・皮膚の問題： タンパク質は、皮膚の健康と修復に重要です。不足すると、皮膚のトラブルや傷の治癒が遅れる可能性があります。\n\n・骨の健康： タンパク質は骨の形成と維持にも関与しています。不足すると骨の健康が損なわれ、骨粗しょう症のリスクが高まる可能性があります。", text: "tapして起こりうる体調の異変を見る", color: .green, number: 4))
            withAnimation {
                weight -= 50
                roundWeight -= 20
//                color = .yellow
            }
            
        }
    
        if value2 >= 10 {
            
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "炭水化物過多", subTitle: "・体重増加: 炭水化物はエネルギー源として機能し、摂り過ぎると余剰なエネルギーが脂肪として蓄積され、体重が増加する可能性があります。\n\n・インスリン抵抗性と糖尿病リスク:　 高炭水化物の食事は、インスリンの分泌を増加させることがあり、長期間にわたってインスリン抵抗性を引き起こす可能性があります。これは糖尿病の発症リスクを高める要因です。\n\n・血糖値の急激な上昇と下降:　 高GI（グリセミック・インデックス）の炭水化物を摂取すると、血糖値が急激に上昇し、その後急激に下降することがあります。これは、空腹感や倦怠感を引き起こし、食事の制御が難しくなる可能性があります。\n\n・心血管リスクの増加:　 過剰な炭水化物摂取は、高コレステロールやトリグリセリドなどの心血管疾患のリスクを増加させる可能性があります。\n\n・腸内環境の変化:　 高炭水化物の食事は腸内細菌のバランスを崩す可能性があり、腸内環境の変化や消化器系の問題を引き起こすことがあります。", text: "tapして起こりうる体調の異変を見る", color: .orange, number: 5))
            withAnimation {
//                color = .yellow
            }
            
        } else if value2 <= 3 {
            
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "炭水化物不足", subTitle: "・エネルギー不足:　 炭水化物は身体にとって主要なエネルギー源です。炭水化物不足の場合、身体はエネルギーを得るために他の栄養素や体内のタンパク質を代謝して利用しようとしますが、これは効率的ではなく、疲労や倦怠感を引き起こす可能性があります。\n\n・血糖値の低下:　 炭水化物は血糖値を安定させる役割を果たします。炭水化物不足の場合、血糖値が低下し、低血糖症の症状が現れる可能性があります。これにはめまい、頭痛、集中力の低下、不安、イライラ、震えなどが含まれます。 \n\n・栄養不足:　 炭水化物を排除しすぎることで、食事から必要なビタミンやミネラル、食物繊維などの栄養素を摂取する機会が減少する可能性があります。これにより、栄養不足に陥るリスクが高まります。\n\n・代謝の変化:　 長期間にわたって炭水化物を制限すると、代謝が変化し、脂肪やタンパク質をエネルギー源として利用するようになる可能性があります。これは、体組織の損傷や筋肉の減少などの影響をもたらす可能性があります。", text: "tapして起こりうる体調の異変を見る", color: .orange, number: 6))
            withAnimation {
//                color = .yellow
            }
            
        }
        
        if value3 >= 20 {
            //肥満
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "脂肪過多", subTitle: "・肥満:　 脂肪が過剰に蓄積すると、肥満になります。肥満は心血管疾患、糖尿病、高血圧、関節炎、睡眠時無呼吸症候群などの慢性疾患のリスクを増加させます。\n\n・心血管疾患:　 過剰な脂肪は、動脈硬化の原因となり、心臓や血管の健康を損なう可能性があります。これにより、心筋梗塞や脳卒中などの心血管疾患のリスクが高まります。\n\n・2型糖尿病:　 過剰な脂肪が膵臓の機能を損ない、インスリン抵抗性を引き起こすことがあります。これにより、血糖値が上昇し、2型糖尿病の発症リスクが高まります。\n\n・関節への負担:　 脂肪の増加は関節に余分な負担をかけ、関節炎のリスクを高める可能性があります。\n\n・がん:　 脂肪組織の増加は、がんの発症リスクを増加させるという研究結果もあります。特に、大腸がん、乳がん、子宮がんなどとの関連が指摘されています。\n\n・精神的影響:　 肥満や過剰な脂肪の蓄積は、自尊心の低下やうつ病のリスクを高めることがあります。\n\n・睡眠障害:　 肥満は睡眠時無呼吸症候群などの睡眠障害のリスクを増加させます。", text: "tapして起こりうる体調の異変を見る", color: .purple, number: 7))
            withAnimation {
                weight += 50
                roundWeight += 20
//                color = .yellow
            }
            
        } else if value3 <= 5 {
            //がり
            problemArray.append(InformationTransferabilitySimulation.problemArray(title: "脂肪不足", subTitle: "・栄養不足:　 過度なダイエットや食事制限によって、必要な栄養素を摂取できなくなる可能性があります。これにより、栄養不良や健康への影響が生じることがあります。\n\n・筋肉量の減少:　 適切な栄養やトレーニングが不足すると、筋肉量が減少します。これは身体の代謝率を低下させ、基礎代謝量が減少することを意味します。\n\n・免疫機能の低下:　 適切な栄養を摂取できないと、免疫機能が低下し、感染症や疾患に対する抵抗力が弱まる可能性があります。 \n\n・生殖機能の低下:　 過度の栄養制限は、ホルモンバランスを乱し、生殖機能に影響を与える可能性があります。女性では月経不順や月経停止、男性では性機能の低下などが見られることがあります。\n\n・骨粗鬆症:　 適切な栄養素が不足すると、骨密度が低下し、骨粗鬆症のリスクが増加します。\n\n・心血管リスクの増加:　 過度の体脂肪の減少により、健康な範囲を下回ると、心血管疾患のリスクが増加する可能性があります。\n\n・精神的影響:　 過度な食事制限や体重減少は、摂食障害や心理的ストレスを引き起こす可能性があります。", text: "tapして起こりうる体調の異変を見る", color: .purple, number: 8))
            withAnimation {
                weight -= 50
                roundWeight -= 20
//                color = .yellow
            }
            
        }
        
    }

    
}

struct problemArray: Any {
    var title: String
    var subTitle: String
    var text: String
    var color: Color
    var number: Int
}
