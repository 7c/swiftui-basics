import SwiftUI

struct Menu: Hashable {
    let title:String
}

struct ContentView: View {
    @State var counter=1
    @State var theview=0
    let menus:[Menu] = [
        .init(title: "Menu1"),
        .init(title: "Menu2")
    ]
    
    var body: some View {
        NavigationView{
            MenuView(menus:menus,counter:$counter,theview:$theview)
            switch theview {
                case 0:MainView1()
                case 1:MainView2()
                default:MainView1()
            }
            
            Text("Counter:"+String(counter))
        }
        .frame(minWidth:600,minHeight: 400)
    }
}




struct MainView1: View {
    var body : some View {
        Text("Main View 1")
    }
}

struct MainView2: View {
    var body : some View {
        Text("Main View 2")
    }
}



struct MenuView: View {
    let menus:[Menu]
    @Binding var counter: Int
    @Binding var theview: Int
    var body: some View {
        VStack {
            ForEach(menus,id:\.self) { option in
                HStack {
                    Text(option.title).foregroundColor(menus[theview] == option ? Color.blue : Color.black)
                }.padding()
            }.onTapGesture {
                print("theview",theview,menus.count)
                theview=theview+1
                theview = theview % menus.count
            }
            
            Button(action: {
                counter+=1
            }) {Text("Count Up")}
            Button(action: {
                counter-=1
            }) {Text("Count Down")}
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
