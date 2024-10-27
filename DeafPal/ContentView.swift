import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = AppCoordinator()

    @StateObject var communicationViewModel: CommunicationViewModel

    init() {
        let repository = MessagesRecordRepository()

        let fetchMessagesUseCase = FetchMessagesRecordUseCase(repository: repository)
        let addMessageRecordUseCase = AddMessageRecordUseCase(repository: repository)
        let deleteMessageRecordUseCase = DeleteMessageRecordUseCase(repository: repository)
        let addMessageToRecordUseCase = AddMessageToRecordUseCase(repository: repository)

        let initialSelectedRecord = fetchMessagesUseCase.execute().first ?? CommunicationViewModel.defaultSeededRecord()

        _communicationViewModel = StateObject(wrappedValue: CommunicationViewModel(
            selectedMessageRecord: initialSelectedRecord,
            fetchMessagesUseCase: fetchMessagesUseCase,
            addMessageRecordUseCase: addMessageRecordUseCase,
            deleteMessageRecordUseCase: deleteMessageRecordUseCase,
            addMessageToRecordUseCase: addMessageToRecordUseCase
        ))
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            Home()
                .navigationDestination(for: AppView.self) { newAppView in
                    switch newAppView {
                    case .home:
                        Home()
                    case .communicaton:
                        CommunicationView()
                    case .medicalInstructions:
                        MedicalInstructionView()
                    case .complaintNote:
                        ComplaintNoteView()
                    }
                }
        }
        .environmentObject(coordinator)
        .environmentObject(communicationViewModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppCoordinator())
        .environmentObject(CommunicationViewModel(
            selectedMessageRecord: CommunicationViewModel.defaultSeededRecord(),
            fetchMessagesUseCase: FetchMessagesRecordUseCase(repository: MessagesRecordRepository()),
            addMessageRecordUseCase: AddMessageRecordUseCase(repository: MessagesRecordRepository()),
            deleteMessageRecordUseCase: DeleteMessageRecordUseCase(repository: MessagesRecordRepository()),
            addMessageToRecordUseCase: AddMessageToRecordUseCase(repository: MessagesRecordRepository())
        ))
}
