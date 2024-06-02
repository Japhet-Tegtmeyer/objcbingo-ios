import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct GameInfoView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel = GameViewModel()
    @State private var isLoading = false
    @State private var errorMessage = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                if isLoading {
                    ProgressView("Loading game info...")
                } else if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {

                    List {
                        MembersView(members: viewModel.sortedMembers)
                    }
                }
            }
            .navigationTitle("Game Info")
            .toolbar {
                Button("Done") {
                   dismiss()
                }
            }
        }
        .onAppear {
            Task {
                await fetchData()
            }
        }
        .refreshable {
            Task {
                await fetchData()
            }
        }
    }

    func fetchData() async {
        isLoading = true
        errorMessage = ""

        do {
            try await viewModel.fetchCurrentGame()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

struct MembersView: View {
    let members: [User]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Members")
                .font(.headline)

            ForEach(members, id: \.id) { member in
                MemberRow(member: member)
            }
        }
    }
}

struct MemberRow: View {
    let member: User

    var body: some View {
        HStack {
            Text(member.initials)
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Circle().fill(Color.gray.opacity(0.5)))

            VStack(alignment: .leading) {
                Text(member.fullName)
                    .font(.headline)
            }
        }
    }
}

struct BoardsView: View {
    let boards: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Boards")
                .font(.headline)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(boards, id: \.self) { board in
                        Image(board)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct GameInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoView()
            .environmentObject(AuthViewModel())
    }
}
#endif
