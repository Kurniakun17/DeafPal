import Foundation

class CommunicationViewModel: ObservableObject {
    @Published var messagesRecords: [MessagesRecord] = []
    @Published var selectedMessageRecord: MessagesRecord
    @Published var textInput: String = ""
    @Published var textRole: UserRole = .user
    @Published var isSpeechEnabled = false

    private let fetchMessageRecordUseCase: FetchMessagesRecordUseCase
    private let addMessageToRecordUseCase: AddMessageToRecordUseCase
    private let addMessageRecordUseCase: AddMessageRecordUseCase
    private let deleteMessageRecordUseCase: DeleteMessageRecordUseCase

    init(
        selectedMessageRecord: MessagesRecord? = nil,
        textInput: String = "",
        textRole: UserRole = .user,
        isSpeechEnabled: Bool = false,
        fetchMessagesUseCase: FetchMessagesRecordUseCase,
        addMessageRecordUseCase: AddMessageRecordUseCase,
        deleteMessageRecordUseCase: DeleteMessageRecordUseCase,
        addMessageToRecordUseCase: AddMessageToRecordUseCase
    ) {
        self.textInput = textInput
        self.textRole = textRole
        self.isSpeechEnabled = isSpeechEnabled
        self.fetchMessageRecordUseCase = fetchMessagesUseCase
        self.addMessageRecordUseCase = addMessageRecordUseCase
        self.deleteMessageRecordUseCase = deleteMessageRecordUseCase
        self.addMessageToRecordUseCase = addMessageToRecordUseCase

        if let record = selectedMessageRecord {
            self.selectedMessageRecord = record
        } else {
            self.selectedMessageRecord = CommunicationViewModel.defaultSeededRecord()
        }

        self.messagesRecords = fetchMessagesUseCase.execute()
    }

    func addMessage() {
        let message = Message(text: textInput, role: textRole, date: Date())
        addMessageToRecordUseCase.execute(messagesRecord: selectedMessageRecord, message: message)

        selectedMessageRecord.messages.append(message)
        textInput = ""
    }

    func deleteMessageRecord(_ record: MessagesRecord) {
        deleteMessageRecordUseCase.execute(record)
        messagesRecords.removeAll { $0.id == record.id }
    }

    func addMessageRecord(_ record: MessagesRecord) {
        addMessageRecordUseCase.execute(record)
        messagesRecords.append(record)
    }

    func quickOptionsHandler(value: String) {
        textInput += " \(value)"
    }

    static func defaultSeededRecord() -> MessagesRecord {
        return MessagesRecord(
            title: "",
            messages: [
                Message(text: "Halo Dokter", role: .user),
                Message(text: "Halo, Apa keluhanmu hari ini?", role: .doctor, quickOptions: ["Demam", "Batuk", "Flu"])
            ],
            date: .now
        )
    }
}
