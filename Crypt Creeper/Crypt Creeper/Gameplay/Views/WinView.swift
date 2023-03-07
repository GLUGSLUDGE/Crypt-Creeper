//
//  WinView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct GameScoreTopLevelResponseModel: Decodable {
    var MAXSCORE: [GameMaxScoreResponseModel]
}
struct GameMaxScoreResponseModel: Decodable {
    var SCORE: Int
}

struct WinView: View {
    @Environment(\.dismiss) private var dismiss
    @State var currentScore:Int
    @ObservedObject var scene:GameScene
    @ObservedObject var vm = GameOverViewModel()
    
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
                .ignoresSafeArea()
            VStack{
                ZStack{
                    VStack{
                        Spacer()
                        if vm.showHighscoreLabel {
                            Text("NEW HIGHSCORE!")
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.ui.textYellow)
                        }
                        Text("SCORE: \(currentScore)")
                            .font(.system(size: 36, weight: .heavy, design: .rounded))
                            .foregroundColor(Color.ui.text)
                    }
                }
                ZStack{
                    Color.ui.colorBGPinkDark
                    Image("ImageBGWin01")
                        .resizable()
                        .scaledToFit()
                    Image("ImageBGWin03")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, -40)
                        .padding(20)
                    Image("ImageKeyHeroWin")
                        .resizable()
                        .scaledToFit()
                    Image("ImageBGWin02")
                        .resizable()
                        .scaledToFill()
                    VStack{
                        HStack{
                            Image("ImageWinLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/2)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                ZStack{
                    VStack{
                        Spacer()
                        Button {
                            scene.reset()
                            dismiss()
                        } label: {
                            MenuButtonLabel(title: "PLAY AGAIN")
                        }
                        Button {
                            
                        } label: {
                            MenuButtonLabel(title: "GO BACK")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            vm.getScoreFromPlayer { score, error  in
                if let score = score {
                    if currentScore > score {
                        vm.showHighscoreLabel = true
                    }
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(currentScore: 32249, scene: GameScene())
    }
}

class GameOverViewModel: ObservableObject {
    @Published var showHighscoreLabel = false
   
    func getScoreFromPlayer(completion: @escaping (_ maxScore: Int?, _ error: NetworkError?) -> ()) {
        let url = "http://127.0.0.1:8000/api/play/get_higher_points"
        
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
            }
            
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil, NetworkError.networkErrorEnum.invalidResponse as? NetworkError)
                return
            }
            // Procesar la respuesta
            do {
                let scoreResponse = try JSONDecoder().decode(GameScoreTopLevelResponseModel.self, from: data)
                let maxScore = scoreResponse.MAXSCORE.first?.SCORE
                completion(maxScore, nil)
           } catch {
               completion(nil, NetworkError.networkErrorEnum.requestFailed as? NetworkError)
           }
            
        }
    }
    func onSuccess(message: Any){
        print(message)
    }
    func onError(error: String){
        print(error)
    }
}
